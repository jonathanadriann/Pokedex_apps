import 'package:pokedex_app/bloc/pokemoninfocubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<int> {
  PokemonInfoCubit pokemonInfoCubit;

  NavCubit({@required this.pokemonInfoCubit}) : super(null);

  void showDetails(int pokemonId) {
    print(pokemonId);
    pokemonInfoCubit.getPokemonDetails(pokemonId);
    emit(pokemonId);
  }

  void popToPokedex() {
    emit(null);
    pokemonInfoCubit.clearPokemonInfo();
  }
}