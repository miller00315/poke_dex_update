import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:poke_dex/config/consts/palette.dart';
import 'package:poke_dex/config/consts/urls.dart';
import 'package:poke_dex/domain/entities/status_entity.dart';
import 'package:poke_dex/domain/repositories/pokemon_repository.dart';
import 'package:poke_dex/domain/repositories/secure_storage_repository.dart';
import 'package:poke_dex/models/pokemon_list_model.dart';
import 'package:poke_dex/models/pokemon_model.dart';
import 'package:poke_dex/utils/string_replace.dart';
import 'dart:developer' as developer;

part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  final PokemonRepository _pokemonRepository;

  final SecureStorageRepository _secureStorageRepository;

  _PokemonStoreBase(
    this._pokemonRepository,
    this._secureStorageRepository,
  );

  @observable
  PokeListModel? _pokeList;

  @observable
  PokemonModel? _currentPokemon;

  @observable
  List<int> favorites = [];

  @observable
  Color? pokemonColor;

  @observable
  int? currentPosition;

  @observable
  StatusEntity fetchStatus = IdleStatus();

  @computed
  PokeListModel? get pokeList => _pokeList;

  @computed
  PokemonModel? get currentPokemon => _currentPokemon;

  @action
  Future fetchPokemonList() async {
    _pokeList = null;

    try {
      fetchStatus = InProgressStatus();

      _pokeList = await _pokemonRepository.fetchPokemonList();

      fetchStatus = DoneStatus();
    } catch (e) {
      fetchStatus = ErrorStatus();
    }
  }

  PokemonModel getPokemon({required int index}) {
    return _pokeList!.pokemonList![index];
  }

  @action
  setCurrentPokemon({required int index}) {
    _currentPokemon = _pokeList!.pokemonList![index];

    pokemonColor = Palette.getColorType(type: _currentPokemon!.type![0]);

    currentPosition = index;
  }

  @action
  Widget getImage({required String number}) {
    return Image.network(
      replaceVariables(
        text: Urls.pokemonImageUrl,
        variables: {Urls.pokemonImageReplaceNumberParameter: number},
      ),
    );
  }

  @action
  Future favoriteUnfavorite(int id) async {
    try {
      if (favorites.contains(id)) {
        favorites = List.from(favorites.where((element) => element != id));
      } else {
        favorites = List.from([...favorites, id]);
      }

      await _secureStorageRepository.setFavoritesItem(favorites);
    } catch (e, stackTrace) {
      developer.log(
        e.toString(),
        name: 'pokemon_store.dart',
        error: stackTrace.toString(),
      );
    }
  }

  @action
  Future getFavorites() async {
    try {
      favorites = await _secureStorageRepository.getFavoritesItems();
    } catch (e, stackTrace) {
      developer.log(
        e.toString(),
        name: 'pokemon_store.dart',
        error: stackTrace.toString(),
      );
    }
  }
}
