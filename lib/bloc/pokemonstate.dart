import 'package:pokedex_app/info/pokemon_list.dart';
import 'package:flutter/material.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadInProgress extends PokemonState {}

class PokemonPageLoadSuccess extends PokemonState {
  final List<ListofPokemon> listofPokemon;
  final bool canLoadNextPage;

  PokemonPageLoadSuccess(
      {@required this.listofPokemon, @required this.canLoadNextPage});
}

class PokemonPageLoadFailed extends PokemonState {
  final Error error;

  PokemonPageLoadFailed({@required this.error});
}