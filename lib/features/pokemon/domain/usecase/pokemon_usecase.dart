import 'package:remindery/core/data/model/exception.dart';
import 'package:remindery/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:remindery/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:dartz/dartz.dart';

class PokemonUseCase {
  final PokemonRepository pokemonRepository;

  PokemonUseCase({required this.pokemonRepository});

  Future<Either<AppException, PokemonEntity>> searchPokemon(
      {required String name}) async {
    final result =
    await pokemonRepository.searchPokemon(name: name.toLowerCase());

    return result.fold(
          (exception) => Left(exception),
          (data) => Right(PokemonEntity(
          name: data.name ?? "-",
          image: data.sprites?.other?.home?.frontDefault ?? "",
          weight: data.weight ?? 0)),
    );
  }
}
