import 'dart:convert';

import 'package:poke_dex/domain/repositories/pokemon_v2_repository.dart';
import 'package:poke_dex/models/specie.dart';
import 'package:poke_dex/models/pokemon_detail_model.dart';
import 'package:poke_dex/services/pokemon_v2_service.dart';

class PokemonV2RepositoryData extends PokemonV2Repository {
  @override
  Future<PokemonDetailModel> fetchPokemonDetails(String name) async {
    final response =
        await PokemonV2Service.fetchPokemonDetails(name);

    Map<String, dynamic> decodedJson = jsonDecode(response.body);

    return PokemonDetailModel.fromJson(decodedJson);
  }

  @override
  Future<SpecieModel> fetchSpecie(String number) async {
    final response = await PokemonV2Service.fetchSpecie(number);

    Map<String, dynamic> decodedJson = jsonDecode(response.body);

    return SpecieModel.fromJson(decodedJson);
  }
}
