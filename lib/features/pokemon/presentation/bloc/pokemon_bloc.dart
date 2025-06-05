import 'package:remindery/core/data/model/exception.dart';
import 'package:remindery/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:remindery/features/pokemon/domain/usecase/pokemon_usecase.dart';
import 'package:bloc/bloc.dart';

part 'pokemon_event.dart';

part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonUseCase pokemonUseCase;

  PokemonBloc({required this.pokemonUseCase}) : super(PokemonInitial()) {
    on<PokemonEvent>((event, emit) async {
      if (event is SearchPokemonEvent) {
        emit(PokemonLoading());

        final result = await pokemonUseCase.searchPokemon(name: event.name);
        result.fold(
            (exception) => emit(PokemonErrorState(appException: exception)),
            (entity) => emit(PokemonResult(pokemonEntity: entity)));
      }
    });
  }
}
