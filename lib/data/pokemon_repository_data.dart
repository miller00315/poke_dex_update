import 'dart:convert';

import 'package:poke_dex/domain/repositories/pokemon_repository.dart';
import 'package:poke_dex/models/pokemon_list_model.dart';
import 'package:poke_dex/services/pokemon_service.dart';

class PokemonRepositoryData extends PokemonRepository {
  @override
  Future<PokeListModel> fetchPokemonList() async {
    final response = await PokemonService.fetchPokemonList();

    Map<String, dynamic> decodedJson = jsonDecode(response.body);

    return PokeListModel.fromJson(decodedJson);
  }
}
