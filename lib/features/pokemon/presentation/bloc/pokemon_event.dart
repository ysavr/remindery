part of 'pokemon_bloc.dart';

abstract class PokemonEvent {}

class SearchPokemonEvent extends PokemonEvent {
  final String name;

  SearchPokemonEvent({
    required this.name,
  });
}
