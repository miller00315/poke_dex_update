import 'package:mobx/mobx.dart';
import 'package:poke_dex/domain/entities/status_entity.dart';
import 'package:poke_dex/domain/repositories/pokemon_v2_repository.dart';
import 'package:poke_dex/models/pokemon_detail_model.dart';
import 'package:poke_dex/models/specie.dart';
import 'dart:developer' as developer;

part 'pokemon_v2_store.g.dart';

class PokemonV2Store = _PokemonV2StoreBase with _$PokemonV2Store;

abstract class _PokemonV2StoreBase with Store {
  final PokemonV2Repository _pokemonV2Repository;

  _PokemonV2StoreBase(this._pokemonV2Repository);

  @observable
  SpecieModel? specie;

  @observable
  PokemonDetailModel? pokemonDetail;

  @observable
  StatusEntity? fetchSpecieStatus;

  @observable
  StatusEntity? fetchPokemonDetailStatus;

  @action
  Future fetchPokemonDetails(String name) async {
    try {
      fetchPokemonDetailStatus = InProgressStatus();

      pokemonDetail =
          await _pokemonV2Repository.fetchPokemonDetails(name.toLowerCase());

      fetchPokemonDetailStatus = DoneStatus();
    } catch (e, stackTrace) {
      developer.log(
        e.toString(),
        name: 'pokemon_v2_store.dart',
        error: stackTrace.toString(),
      );

      fetchPokemonDetailStatus = ErrorStatus();
    }
  }

  @action
  Future fetchSpecie(int number) async {
    try {
      fetchSpecieStatus = InProgressStatus();

      specie = await _pokemonV2Repository.fetchSpecie(number.toString());

      fetchSpecieStatus = DoneStatus();
    } catch (e, stackTrace) {
      developer.log(
        e.toString(),
        name: 'pokemon_v2_store.dart',
        error: stackTrace.toString(),
      );
      
      fetchSpecieStatus = ErrorStatus();
    }
  }
}
