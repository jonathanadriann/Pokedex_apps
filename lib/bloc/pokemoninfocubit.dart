import 'package:pokedex_app/info/pokemoninfo.dart';
import 'package:pokedex_app/info/pokemondetails.dart';
import 'package:pokedex_app/info/pokemonrepo.dart';
import 'package:pokedex_app/info/pokemonspeciesdetails.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonInfoCubit extends Cubit<PokemonInfo> {
  final _pokemonRepository = PokemonRepo();

  PokemonInfoCubit() : super(null);

  void getPokemonDetails(int pokemonId) async {
    final responses = await Future.wait([
      _pokemonRepository.getInfo(pokemonId),
      _pokemonRepository.getSpeciesDetails(pokemonId)
    ]);

    final pokemonInfo = responses[0] as PokemonDetailsResponse;
    final speciesInfo = responses[1] as PokemonSpeciesDetailsResponse;

    emit(PokemonInfo(
        id: pokemonInfo.id,
        name: pokemonInfo.name,
        imageUrl: pokemonInfo.imageUrl,
        types: pokemonInfo.types,
        height: pokemonInfo.height,
        weight: pokemonInfo.weight,
        description: speciesInfo.description));
  }

  void clearPokemonInfo() => emit(null);
}