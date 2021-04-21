import 'package:pokedex_app/bloc/pokemonevent.dart';
import 'package:pokedex_app/bloc/pokemonstate.dart';
import 'package:pokedex_app/info/pokemonrepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepository = PokemonRepo();

  PokemonBloc() : super(PokemonInitial());

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is PokemonPageRequest) {
      yield PokemonLoadInProgress();

      try {
        final pokemonPageResponse =
            await _pokemonRepository.getPokemonPag(event.page);
        yield PokemonPageLoadSuccess(
            listofPokemon: pokemonPageResponse.listofPokemon,
            canLoadNextPage: pokemonPageResponse.canLoadNextPage);
      } catch (e) {
        yield PokemonPageLoadFailed(error: e);
      }
    }
  }
}