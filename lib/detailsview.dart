import 'package:pokedex_app/bloc/pokemoninfocubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'info/pokemoninfo.dart';

class DetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon Info'),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.yellowAccent,
      body: BlocBuilder<PokemonInfoCubit, PokemonInfo>(
        builder: (context, details) {
          return details != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 350,
                          height: 500,
                          child: Card(
                            elevation: 10,
                            color: Colors.white60,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.network(details.imageUrl),

                                Text(details.name, style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold)),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: details.types
                                      .map((type) => _pokemonTypeView(type))
                                      .toList(),
                                ),
                                Text(
                                  '\n ID: ${details.id}\nWeight: ${details.weight}\nHeight: ${details.height}\n', textAlign: TextAlign.center
                                ,style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)  
                                ),
                                Text(
                                  details.description,
                                  textAlign: TextAlign.center, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600)
                                ),     
                              ],
                            ),
                            ),                          
                          ),
                      ),
                    ],
                  )
                )
          :Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _pokemonTypeView(String type) {
    Color color;

    switch (type) {
      case 'normal':
        color = Color(0xFFbdbeb0);
        break;
      case 'poison':
        color = Color(0xFF995E98);
        break;
      case 'psychic':
        color = Color(0xFFE96EB0);
        break;
      case 'grass':
        color = Color(0xFF9CD363);
        break;
      case 'ground':
        color = Color(0xFFE3C969);
        break;
      case 'ice':
        color = Color(0xFFAFF4FD);
        break;
      case 'fire':
        color = Color(0xFFE7614D);
        break;
      case 'rock':
        color = Color(0xFFCBBD7C);
        break;
      case 'dragon':
        color = Color(0xFF8475F7);
        break;
      case 'water':
        color = Color(0xFF6DACF8);
        break;
      case 'bug':
        color = Color(0xFFC5D24A);
        break;
      case 'dark':
        color = Color(0xFF886958);
        break;
      case 'fighting':
        color = Color(0xFF9E5A4A);
        break;
      case 'ghost':
        color = Color(0xFF7774CF);
        break;
      case 'steel':
        color = Color(0xFFC3C3D9);
        break;
      case 'flying':
        color = Color(0xFF81A2F8);
        break;
      case 'normal':
        color = Color(0xFFF9E65E);
        break;
      case 'fairy':
        color = Color(0xFFEEB0FA);
        break;
      default:
        color = Colors.black;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Text(
          type.toUpperCase(),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}