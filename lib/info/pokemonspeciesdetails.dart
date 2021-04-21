import 'package:flutter/material.dart';

class PokemonSpeciesDetailsResponse {
  final String description;

  PokemonSpeciesDetailsResponse({@required this.description});

  factory PokemonSpeciesDetailsResponse.fromJson(Map<String, dynamic> json) {
    return PokemonSpeciesDetailsResponse(
        description: json['flavor_text_entries'][0]['flavor_text']);
  }
}