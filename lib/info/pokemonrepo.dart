import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/info/pokemon_list.dart';
import 'package:pokedex_app/info/pokemondetails.dart';
import 'package:pokedex_app/info/pokemonspeciesdetails.dart';

class PokemonRepo {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPage> getPokemonPag(int pageIndex) async {
    final queryParameters = {
      'limit': '151',
      'offset': (pageIndex * 151).toString()
    };

    final uri = Uri.https(baseUrl, 'api/v2/pokemon', queryParameters);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonPage.fromJson(json);
  }

  Future<PokemonDetailsResponse> getInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonDetailsResponse.fromJson(json);
    } catch (e) {
      print(e);
    }
  }

  Future<PokemonSpeciesDetailsResponse> getSpeciesDetails(
      int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonSpeciesDetailsResponse.fromJson(json);
    } catch (e) {
      print(e);
    }
  }
}