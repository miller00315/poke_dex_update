import 'package:poke_dex/domain/repositories/pokemon_v2_repository.dart';
import 'package:poke_dex/models/specie.dart';
import 'package:poke_dex/models/pokemon_detail_model.dart';

class PokemonV2RepositoryMock extends PokemonV2Repository {
  @override
  Future<PokemonDetailModel> fetchPokemonDetails(String name) {
    // TODO: implement fetchPokemonDetails
    throw UnimplementedError();
  }

  @override
  Future<SpecieModel> fetchSpecie(String number) {
    // TODO: implement fetchSpecie
    throw UnimplementedError();
  }

}