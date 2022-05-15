// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_v2_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonV2Store on _PokemonV2StoreBase, Store {
  late final _$specieAtom =
      Atom(name: '_PokemonV2StoreBase.specie', context: context);

  @override
  SpecieModel? get specie {
    _$specieAtom.reportRead();
    return super.specie;
  }

  @override
  set specie(SpecieModel? value) {
    _$specieAtom.reportWrite(value, super.specie, () {
      super.specie = value;
    });
  }

  late final _$pokemonDetailAtom =
      Atom(name: '_PokemonV2StoreBase.pokemonDetail', context: context);

  @override
  PokemonDetailModel? get pokemonDetail {
    _$pokemonDetailAtom.reportRead();
    return super.pokemonDetail;
  }

  @override
  set pokemonDetail(PokemonDetailModel? value) {
    _$pokemonDetailAtom.reportWrite(value, super.pokemonDetail, () {
      super.pokemonDetail = value;
    });
  }

  late final _$fetchSpecieStatusAtom =
      Atom(name: '_PokemonV2StoreBase.fetchSpecieStatus', context: context);

  @override
  StatusEntity? get fetchSpecieStatus {
    _$fetchSpecieStatusAtom.reportRead();
    return super.fetchSpecieStatus;
  }

  @override
  set fetchSpecieStatus(StatusEntity? value) {
    _$fetchSpecieStatusAtom.reportWrite(value, super.fetchSpecieStatus, () {
      super.fetchSpecieStatus = value;
    });
  }

  late final _$fetchPokemonDetailStatusAtom = Atom(
      name: '_PokemonV2StoreBase.fetchPokemonDetailStatus', context: context);

  @override
  StatusEntity? get fetchPokemonDetailStatus {
    _$fetchPokemonDetailStatusAtom.reportRead();
    return super.fetchPokemonDetailStatus;
  }

  @override
  set fetchPokemonDetailStatus(StatusEntity? value) {
    _$fetchPokemonDetailStatusAtom
        .reportWrite(value, super.fetchPokemonDetailStatus, () {
      super.fetchPokemonDetailStatus = value;
    });
  }

  late final _$fetchPokemonDetailsAsyncAction =
      AsyncAction('_PokemonV2StoreBase.fetchPokemonDetails', context: context);

  @override
  Future<dynamic> fetchPokemonDetails(String name) {
    return _$fetchPokemonDetailsAsyncAction
        .run(() => super.fetchPokemonDetails(name));
  }

  late final _$fetchSpecieAsyncAction =
      AsyncAction('_PokemonV2StoreBase.fetchSpecie', context: context);

  @override
  Future<dynamic> fetchSpecie(int number) {
    return _$fetchSpecieAsyncAction.run(() => super.fetchSpecie(number));
  }

  @override
  String toString() {
    return '''
specie: ${specie},
pokemonDetail: ${pokemonDetail},
fetchSpecieStatus: ${fetchSpecieStatus},
fetchPokemonDetailStatus: ${fetchPokemonDetailStatus}
    ''';
  }
}
