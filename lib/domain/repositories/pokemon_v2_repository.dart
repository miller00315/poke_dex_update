import 'package:poke_dex/models/pokemon_detail_model.dart';
import 'package:poke_dex/models/specie.dart';

abstract class PokemonV2Repository {
  Future<SpecieModel> fetchSpecie(String number);

  Future<PokemonDetailModel> fetchPokemonDetails(String name);
}
