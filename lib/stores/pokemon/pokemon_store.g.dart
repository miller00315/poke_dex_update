// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonStore on _PokemonStoreBase, Store {
  Computed<PokeListModel?>? _$pokeListComputed;

  @override
  PokeListModel? get pokeList =>
      (_$pokeListComputed ??= Computed<PokeListModel?>(() => super.pokeList,
              name: '_PokemonStoreBase.pokeList'))
          .value;
  Computed<PokemonModel?>? _$currentPokemonComputed;

  @override
  PokemonModel? get currentPokemon => (_$currentPokemonComputed ??=
          Computed<PokemonModel?>(() => super.currentPokemon,
              name: '_PokemonStoreBase.currentPokemon'))
      .value;

  late final _$_pokeListAtom =
      Atom(name: '_PokemonStoreBase._pokeList', context: context);

  @override
  PokeListModel? get _pokeList {
    _$_pokeListAtom.reportRead();
    return super._pokeList;
  }

  @override
  set _pokeList(PokeListModel? value) {
    _$_pokeListAtom.reportWrite(value, super._pokeList, () {
      super._pokeList = value;
    });
  }

  late final _$_currentPokemonAtom =
      Atom(name: '_PokemonStoreBase._currentPokemon', context: context);

  @override
  PokemonModel? get _currentPokemon {
    _$_currentPokemonAtom.reportRead();
    return super._currentPokemon;
  }

  @override
  set _currentPokemon(PokemonModel? value) {
    _$_currentPokemonAtom.reportWrite(value, super._currentPokemon, () {
      super._currentPokemon = value;
    });
  }

  late final _$favoritesAtom =
      Atom(name: '_PokemonStoreBase.favorites', context: context);

  @override
  ObservableList<int> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<int> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$pokemonColorAtom =
      Atom(name: '_PokemonStoreBase.pokemonColor', context: context);

  @override
  Color? get pokemonColor {
    _$pokemonColorAtom.reportRead();
    return super.pokemonColor;
  }

  @override
  set pokemonColor(Color? value) {
    _$pokemonColorAtom.reportWrite(value, super.pokemonColor, () {
      super.pokemonColor = value;
    });
  }

  late final _$currentPositionAtom =
      Atom(name: '_PokemonStoreBase.currentPosition', context: context);

  @override
  int? get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(int? value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  late final _$fetchStatusAtom =
      Atom(name: '_PokemonStoreBase.fetchStatus', context: context);

  @override
  StatusEntity get fetchStatus {
    _$fetchStatusAtom.reportRead();
    return super.fetchStatus;
  }

  @override
  set fetchStatus(StatusEntity value) {
    _$fetchStatusAtom.reportWrite(value, super.fetchStatus, () {
      super.fetchStatus = value;
    });
  }

  late final _$fetchPokemonListAsyncAction =
      AsyncAction('_PokemonStoreBase.fetchPokemonList', context: context);

  @override
  Future<dynamic> fetchPokemonList() {
    return _$fetchPokemonListAsyncAction.run(() => super.fetchPokemonList());
  }

  late final _$favoriteUnfavoriteAsyncAction =
      AsyncAction('_PokemonStoreBase.favoriteUnfavorite', context: context);

  @override
  Future<dynamic> favoriteUnfavorite(int id) {
    return _$favoriteUnfavoriteAsyncAction
        .run(() => super.favoriteUnfavorite(id));
  }

  late final _$getFavoritesAsyncAction =
      AsyncAction('_PokemonStoreBase.getFavorites', context: context);

  @override
  Future<dynamic> getFavorites() {
    return _$getFavoritesAsyncAction.run(() => super.getFavorites());
  }

  late final _$_PokemonStoreBaseActionController =
      ActionController(name: '_PokemonStoreBase', context: context);

  @override
  dynamic setCurrentPokemon({required int index}) {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.setCurrentPokemon');
    try {
      return super.setCurrentPokemon(index: index);
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage({required String number}) {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.getImage');
    try {
      return super.getImage(number: number);
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favorites: ${favorites},
pokemonColor: ${pokemonColor},
currentPosition: ${currentPosition},
fetchStatus: ${fetchStatus},
pokeList: ${pokeList},
currentPokemon: ${currentPokemon}
    ''';
  }
}
