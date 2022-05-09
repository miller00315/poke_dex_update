import 'dart:convert';

import 'package:poke_dex/domain/repositories/pokemon_repository.dart';
import 'package:poke_dex/models/pokemon_list_model.dart';
import 'package:poke_dex/services/pokemon_service.dart';

class PokemonRepositoryData extends PokemonRepository {
  final PokemonService _pokemonService;

  PokemonRepositoryData(this._pokemonService);

  @override
  Future<PokeListModel> fetchPokemonList() async {
    final response = await _pokemonService.fetchPokemonList();

    Map<String, dynamic> decodedJson = jsonDecode(response.body);

    return PokeListModel.fromJson(decodedJson);
  }
}
