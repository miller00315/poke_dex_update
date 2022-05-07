import 'dart:async';

import 'package:poke_dex/domain/repositories/pokemon_repository.dart';
import 'package:poke_dex/models/pokemon_list_model.dart';
import 'package:poke_dex/models/pokemon_model.dart';

import '../models/evolution_model.dart';

class PokemonRepositoryMock extends PokemonRepository {
  @override
  Future<PokeListModel> fetchPokemonList() async {
    final result = Future.delayed(
      const Duration(microseconds: 2000),
      () => const PokeListModel(
        pokemonList: [
          PokemonModel(
            id: 1,
            num: '001',
            name: 'Bulbasaur',
            img: 'http://www.serebii.net/pokemongo/pokemon/001.png',
            type: ['Grass', 'Poison'],
            height: '0.71 m',
            weight: '6.9 kg',
            candy: 'Bulbasaur Candy',
            egg: '2 km',
            nextEvolution: [EvolutionModel(name: 'Ivysaur', number: '002')],
            prevEvolution: null,
          ),
          PokemonModel(
            id: 2,
            num: '002',
            name: 'Ivysaur',
            img: 'http://www.serebii.net/pokemongo/pokemon/002.png',
            type: ['Grass', 'Poison'],
            height: '0.99 m',
            weight: '13.0 kg',
            candy: 'Bulbasaur Candy',
            egg: 'Not in Eggs',
            nextEvolution: [EvolutionModel(name: 'Venusaur', number: '003')],
            prevEvolution: null,
          ),
        ],
      ),
    );

    return result;
  }
}
