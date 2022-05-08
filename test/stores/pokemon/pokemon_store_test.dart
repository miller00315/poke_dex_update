import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_dex/data/secure_storage_repository_data.dart';
import 'package:poke_dex/mock/pokemon_repository_mock.dart';
import 'package:poke_dex/mock/secure_storage_repository_mock.dart';
import 'package:poke_dex/models/pokemon_list_model.dart';
import 'package:poke_dex/stores/pokemon/pokemon_store.dart';

import 'pokemon_store_test.mocks.dart';

@GenerateMocks([PokemonRepositoryMock, SecureStorageRepositoryMock])
void main() {
  final pokemonRepositoryMock = MockPokemonRepositoryMock();
  final secureStorageRepositoryMock = MockSecureStorageRepositoryMock();

  final PokemonStore pokemonStore =
      PokemonStore(pokemonRepositoryMock, secureStorageRepositoryMock);
  group('PokemonStore group', () {
    test('should set a pokemonList empty', () async {
      when(pokemonRepositoryMock.fetchPokemonList()).thenAnswer(
        (_) => Future.value(
          const PokeListModel(
            pokemonList: [],
          ),
        ),
      );

      await pokemonStore.fetchPokemonList();

      verify(pokemonRepositoryMock.fetchPokemonList()).called(1);

      expect(pokemonStore.pokeList != null, true);

      expect(pokemonStore.pokeList!.pokemonList!.isEmpty, true);
    });

    test('should set a favorites with one element', () async {
      when(secureStorageRepositoryMock.getFavoritesItems())
          .thenAnswer((_) => Future.value([1]));

      await pokemonStore.getFavorites();

      expect(pokemonStore.favorites.length == 1, true);
    });
  });
}
