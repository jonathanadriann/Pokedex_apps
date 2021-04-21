import 'package:pokedex_app/bloc/pokemonbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/pokemonstate.dart';
import 'bloc/navcubit.dart';

class Mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image(
                image: AssetImage('images/logo.png'), height: 250,
              ),
            ],
          ),
        ),

      body: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is PokemonLoadInProgress) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PokemonPageLoadSuccess) {
              return GridView.builder(
                padding: const EdgeInsets.all(5),
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: state.listofPokemon.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => BlocProvider.of<NavCubit>(context).showDetails(state.listofPokemon[index].id),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        ),
                      color: Colors.yellowAccent,
                      elevation: 5,
                      child: GridTile(
                        child: Column(
                          children: <Widget>[
                            Padding(
                            padding: EdgeInsets.only(left:30, right: 30, top: 30),
                            child: Image.network(state.listofPokemon[index].imageUrl),                      
                            ),
                            Text(state.listofPokemon[index].name, style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is PokemonPageLoadFailed) {
              return Center(
                child: Text(state.error.toString()),
              );
            } else {
              return Container();
            }
          },
        ),
    );
  }
}