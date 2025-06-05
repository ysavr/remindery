import 'package:remindery/core/data/model/exception.dart';
import 'package:remindery/features/pokemon/data/models/pokemon_dto.dart';
import 'package:dartz/dartz.dart';

abstract class PokemonRepository {
  Future<Either<AppException, PokemonDto>> searchPokemon({required String name});
}