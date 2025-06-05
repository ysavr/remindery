import 'package:dio/dio.dart';

import 'package:remindery/core/logger/logger.dart';
import 'package:remindery/core/shared_preferences/shared_preference_service.dart';
import 'package:remindery/core/static_constants/app_constant.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final SharedPreferenceService sharedPreferences;

  AuthInterceptor({required this.dio,  required this.sharedPreferences});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var accessToken = await sharedPreferences.getString(AppConstant.prefAccessToken) ?? '';
    options.headers['Authorization'] = 'Bearer $accessToken';
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Attempt token refresh
      final isRefreshed = await _refreshToken();
      if (isRefreshed) {
        // Retry the failed request
        final opts = err.requestOptions;
        final cloneReq = await dio.request(
          opts.path,
          options: Options(
            method: opts.method,
            headers: opts.headers,
          ),
          data: opts.data,
          queryParameters: opts.queryParameters,
        );
        return handler.resolve(cloneReq);
      }
    }
    return handler.next(err); // Forward the error if refresh fails
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await sharedPreferences.getString(AppConstant.prefRefreshToken);
      if (refreshToken == null) return false;

      var formData = FormData.fromMap({'refresh_token': await sharedPreferences.getString(AppConstant.prefRefreshToken) ?? ''});
      final response = await dio.post(
        '/public/refresh-token',
        data: formData,
      );

      if (response.statusCode == 200) {
        // Save new tokens
        await sharedPreferences.writeValue(
            AppConstant.prefRefreshToken, response.data["data"]["refresh_token"]);
        await sharedPreferences.writeValue(
            AppConstant.prefAccessToken, response.data["data"]["access_token"]);

        return true;
      }
      return false;
    } catch (e) {
      Log.e('Token refresh failed: $e');
      return false;
    }
  }
}
