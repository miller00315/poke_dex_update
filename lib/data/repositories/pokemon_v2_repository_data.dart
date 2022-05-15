import 'dart:convert';

import 'package:poke_dex/domain/repositories/pokemon_v2_repository.dart';
import 'package:poke_dex/models/specie.dart';
import 'package:poke_dex/models/pokemon_detail_model.dart';
import 'package:poke_dex/services/pokemon_v2_service.dart';

/// Repositório referente a api pokemonV2
class PokemonV2RepositoryData extends PokemonV2Repository {
  /// Serviço reposnsável por solicitar a api os dados da api
  final PokemonV2Service _pokemonV2Service;

  PokemonV2RepositoryData(this._pokemonV2Service);

  /// Obtem os dados sobre os detalhes dos pokemons, [name] representa o nome do pookemon
  @override
  Future<PokemonDetailModel> fetchPokemonDetails(String name) async {
    final response = await _pokemonV2Service.fetchPokemonDetails(name);

    Map<String, dynamic> decodedJson = jsonDecode(response.body);

    return PokemonDetailModel.fromJson(decodedJson);
  }

  /// Obetém os dados sobre a espécie do pokemon, [number] representa o número do pokemon enviado pela api
  @override
  Future<SpecieModel> fetchSpecie(String number) async {
    final response = await _pokemonV2Service.fetchSpecie(number);

    Map<String, dynamic> decodedJson = jsonDecode(response.body);

    return SpecieModel.fromJson(decodedJson);
  }
}
