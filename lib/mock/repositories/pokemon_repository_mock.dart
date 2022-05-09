import 'dart:async';

import 'package:poke_dex/domain/repositories/pokemon_repository.dart';
import 'package:poke_dex/mock/fake_data/pokemon_fake_data.dart';
import 'package:poke_dex/models/pokemon_list_model.dart';

class PokemonRepositoryMock extends PokemonRepository {
  @override
  Future<PokeListModel> fetchPokemonList() async {
    final result = Future.delayed(
      const Duration(microseconds: 2000),
      () => const PokeListModel(
        pokemonList: PokemonFakeData.pokemonList,
      ),
    );

    return result;
  }
}
