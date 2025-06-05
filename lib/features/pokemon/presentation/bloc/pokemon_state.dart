part of 'pokemon_bloc.dart';

abstract class PokemonState {}

final class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonErrorState extends PokemonState {
  final AppException appException;

  PokemonErrorState({required this.appException});
}

class PokemonResult extends PokemonState {
  final PokemonEntity pokemonEntity;

  PokemonResult({required this.pokemonEntity});
}
