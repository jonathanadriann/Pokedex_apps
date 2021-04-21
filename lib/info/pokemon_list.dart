import 'package:flutter/foundation.dart';

class ListofPokemon {
  final int id;
  final String name;

  String get imageUrl => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  ListofPokemon({@required this.id, @required this.name});

  factory ListofPokemon.fromJson(Map<String, dynamic> json){
    final name = json['name'];
    final url= json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return ListofPokemon(id: id, name: name);
  }
}

class PokemonPage {
  final List<ListofPokemon> listofPokemon;
  final bool canLoadNextPage;

  PokemonPage(
    {@required this.listofPokemon, @required this.canLoadNextPage}
  );

  factory PokemonPage.fromJson(Map<String, dynamic > json) {
    final canLoadNextPage = json['next'] != null;
    final listofPokemon = (json['results'] as List).map((listingJson) => ListofPokemon.fromJson(listingJson))
    .toList();

    return PokemonPage(listofPokemon: listofPokemon, canLoadNextPage: canLoadNextPage);
  }
}