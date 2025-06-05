import 'dart:io';

import 'package:remindery/core/data/model/error_response_model.dart';
import 'package:remindery/core/data/model/exception.dart';
import 'package:remindery/features/pokemon/data/models/pokemon_dto.dart';
import 'package:remindery/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final Dio dio;

  PokemonRepositoryImpl({required this.dio});

  @override
  Future<Either<AppException, PokemonDto>> searchPokemon(
      {required String name}) async {
    try {
      final response = await dio.get("/pokemon/$name");
      return Right(PokemonDto.fromJson(response.data));
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionError) {
        return Left(AppException(
          message: 'Failed to connect to server',
          errorMap: {},
        ));
      }

      if (error.response != null && error.response?.data != null) {
        try {
          final errorResponse =
          ErrorResponseModel.fromJson(error.response!.data);
          if (errorResponse.errors.isNotEmpty) {
            return Left(AppException(
              message: errorResponse.errors[0].message,
              errorMap: {},
            ));
          }
        } catch (_) {
          return Left(AppException(
            code: error.response?.statusCode,
            message: 'Failed to get data',
            errorMap: {},
          ));
        }
      }

      return Left(AppException(
        message: 'Failed to get data',
        errorMap: {},
      ));
    } on SocketException {
      return Left(AppException(
        message: 'No internet connection',
        errorMap: {},
      ));
    } catch (e) {
      return Left(AppException(
        message: 'An unexpected error occurred',
        errorMap: {},
      ));
    }
  }
}
