import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:poke_dex/config/consts/palette.dart';
import 'package:poke_dex/config/consts/urls.dart';
import 'package:poke_dex/domain/entities/status_entity.dart';
import 'package:poke_dex/domain/repositories/pokemon_repository.dart';
import 'package:poke_dex/models/pokemon_list_model.dart';
import 'package:poke_dex/models/pokemon_model.dart';
import 'package:poke_dex/utils/string_replace.dart';

part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  final PokemonRepository pokemonRepository;

  _PokemonStoreBase(this.pokemonRepository);

  @observable
  PokeListModel? _pokeList;

  @observable
  PokemonModel? _currentPokemon;

  @observable
  Color? pokemonColor;

  @observable
  int? currentPosition;

  @observable
  StatusEntity? fetchStatus;

  @computed
  PokeListModel? get pokeList => _pokeList;

  @computed
  PokemonModel? get currentPokemon => _currentPokemon;

  @action
  Future fetchPokemonList() async {
    _pokeList = null;

    try {
      fetchStatus = InProgressStatus();

      _pokeList = await pokemonRepository.fetchPokemonList();

      fetchStatus = DoneStatus();
    } catch (e) {
      fetchStatus = ErrorStatus();
    }
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
        text: Urls.POKEMON_IMAGE_URL,
        variables: {Urls.POKEMON_IMAGE_NUMBER: number},
      ),
    );
  }
}
