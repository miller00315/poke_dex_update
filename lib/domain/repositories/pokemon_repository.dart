import 'package:poke_dex/models/pokemon_list_model.dart';

abstract class PokemonRepository {
  Future<PokeListModel> fetchPokemonList();
}
