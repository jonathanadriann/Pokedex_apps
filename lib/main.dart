import 'package:pokedex_app/appnav.dart';
import 'package:pokedex_app/bloc/navcubit.dart';
import 'package:pokedex_app/bloc/pokemonbloc.dart';
import 'package:pokedex_app/bloc/pokemonevent.dart';
import 'package:pokedex_app/bloc/pokemoninfocubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonInfoCubit = PokemonInfoCubit();
    return MaterialApp(
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
                PokemonBloc()..add(PokemonPageRequest(page: 0))),
                BlocProvider(create: (context) => NavCubit(pokemonInfoCubit: pokemonInfoCubit)),
                BlocProvider(create: (context) => pokemonInfoCubit)
      ], child: AppNav()),
    
      debugShowCheckedModeBanner: false,

    );
  }
}