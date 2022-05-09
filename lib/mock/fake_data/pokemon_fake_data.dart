import 'package:poke_dex/models/evolution_model.dart';
import 'package:poke_dex/models/pokemon_list_model.dart';
import 'package:poke_dex/models/pokemon_model.dart';

class HttpFakeResponse {
  late String body;

  HttpFakeResponse({required this.body});
}

/// Esta classe possui dados falsos que pode ser utilizados nos mocks
class PokemonFakeData {
  static const pokeList = PokeListModel(pokemonList: pokemonList);

  static const pokemonList = [
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
      prevEvolution: [],
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
      prevEvolution: [],
    ),
  ];
}
