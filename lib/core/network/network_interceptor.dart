import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_alice/alice.dart';

import 'package:remindery/core/di/dependency_injection.dart';
import 'package:remindery/core/flavor/flavour_config.dart';
import 'package:remindery/core/logger/logger.dart';
import 'package:remindery/core/shared_preferences/shared_preference_service.dart';
import 'package:remindery/core/static_constants/app_constant.dart';

Dio addInterceptors({required Dio dio, required SharedPreferenceService sharedPreferences}) {

  if (FlavorConfig.isDevelop()) {
    log("Alice: interceptor develop");
    final Alice alice = getIt();
    dio.interceptors.add(alice.getDioInterceptor());
  }
  dio.interceptors.add(
    QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        if (options.headers.containsKey("addToken") &&
            options.headers["addToken"]) {
          options.headers.remove("addToken");

          //add token to request
          var token = await sharedPreferences.getString(AppConstant.prefAccessToken) ?? '';
          options.headers["Authorization"] = "Bearer $token";
          //end token addition
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        handler.next(response);
      },
      onError: (error, handler) async {
        bool failedGetToken = false;
        if ((error.response != null && error.response?.statusCode == 401)) {
          Log.e('the token has expired, need to receive new token : ${error.requestOptions.uri}');
          Log.e('header : ${error.requestOptions.headers}');
          final options = error.response!.requestOptions;

          Response? tokenResult;
          try {
            var formData = FormData.fromMap({'refresh_token': await sharedPreferences.getString(AppConstant.prefRefreshToken) ?? ''});
            tokenResult = await dio.post(
              '/public/refresh-token',
              data: formData,
            );

          } catch (e) {
            Log.d('catch refresh token real uri ${tokenResult?.realUri}');
            Log.e('catch refresh token $e');
            await sharedPreferences.remove(AppConstant.prefAccessToken);
            await sharedPreferences.remove(AppConstant.prefRefreshToken);

            // final currentContext = navigatorKey.currentState?.context;
            // if (currentContext != null && currentContext.mounted) {
            //   BlocProvider.of<AuthBloc>(currentContext).add(AutoLogoutEvent());
            //   Navigator.of(currentContext).pushAndRemoveUntil(
            //     MaterialPageRoute(
            //       builder: (context) => LoginScreen(),
            //     ), (route) => false,
            //   );
            // }
            failedGetToken = true;
          }

          if (failedGetToken) {
            Log.e("failed to get new token");
            failedGetToken = false;
            return handler.next(error);
          }

          if (tokenResult == null) {
            Log.e("failed to get new token");
            failedGetToken = false;
            return handler.next(error);
          }

          Log.e("old token ${error.requestOptions.headers}");
          Log.e("new token ${tokenResult.data["data"]["access_token"]}");

          await sharedPreferences.writeValue(
              AppConstant.prefRefreshToken, tokenResult.data["data"]["refresh_token"]);
          await sharedPreferences.writeValue(
              AppConstant.prefAccessToken, tokenResult.data["data"]["access_token"]);

          options.headers['addToken'] = true;

          if (tokenResult.data["data"]["access_token"] != null) {
            Log.d('the token has been updated');
            final originResult = await dio.fetch(options..path);
            if (originResult.statusCode != null &&
                originResult.statusCode! ~/ 100 == 2) {
              return handler.resolve(originResult);
            }
          }
          Log.d('the token has not been updated');
          return handler.reject(
            DioException(requestOptions: options),
          );
        }
        return handler.next(error);
      },
    ),
  );
  return dio;
}
