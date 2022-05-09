import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mob;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_dex/domain/entities/status_entity.dart';
import 'package:poke_dex/mock/fake_data/pokemon_fake_data.dart';
import 'package:poke_dex/mock/repositories/pokemon_repository_mock.dart';
import 'package:poke_dex/mock/repositories/secure_storage_repository_mock.dart';
import 'package:poke_dex/models/pokemon_list_model.dart';
import 'package:poke_dex/stores/pokemon/pokemon_store.dart';

import 'pokemon_store_test.mocks.dart';

abstract class Callable<T> {
  void call([T? arg]) {}
}

class MockCallable<T> extends Mock implements Callable<T> {}

@GenerateMocks([PokemonRepositoryMock, SecureStorageRepositoryMock])
void main() {
  final pokemonRepositoryMock = MockPokemonRepositoryMock();
  final secureStorageRepositoryMock = MockSecureStorageRepositoryMock();

  late PokemonStore pokemonStore;

  setUp(() {
    pokemonStore =
        PokemonStore(pokemonRepositoryMock, secureStorageRepositoryMock);
  });

  group('PokemonStore group', () {
    test('should fetch a pokemon list and set [fetchStatus] as [DoneStatus]',
        () async {
      assert(pokemonStore.fetchStatus is IdleStatus);
      assert(pokemonStore.pokeList == null);

      final statusChanged = MockCallable<StatusEntity>();

      when(pokemonRepositoryMock.fetchPokemonList()).thenAnswer(
        (_) => Future.value(
          PokemonFakeData.pokeList,
        ),
      );

      mob.reaction<StatusEntity>((p_) => pokemonStore.fetchStatus,
          (newValue) => statusChanged(newValue));

      await pokemonStore.fetchPokemonList();

      verify(pokemonRepositoryMock.fetchPokemonList()).called(1);

      verifyInOrder([
        statusChanged(InProgressStatus()),
        statusChanged(DoneStatus()),
      ]);

      expect(pokemonStore.pokeList != null, true);

      expect(pokemonStore.pokeList!.pokemonList!.length, 2);
    });

    test('should set [status] as [errorStatus] when throws', () async {
      assert(pokemonStore.fetchStatus is IdleStatus);
      assert(pokemonStore.pokeList == null);

      final statusChanged = MockCallable<StatusEntity>();

      when(pokemonRepositoryMock.fetchPokemonList()).thenAnswer(
        (_) => Future.error('error'),
      );

      mob.reaction<StatusEntity>((p_) => pokemonStore.fetchStatus,
          (newValue) => statusChanged(newValue));

      await pokemonStore.fetchPokemonList();

      verify(pokemonRepositoryMock.fetchPokemonList()).called(1);

      verifyInOrder([
        statusChanged(InProgressStatus()),
        statusChanged(ErrorStatus()),
      ]);

      expect(pokemonStore.pokeList, null);
    });

    test('should set a favorites with one element', () async {
      when(secureStorageRepositoryMock.getFavoritesItems())
          .thenAnswer((_) => Future.value([1]));

      await pokemonStore.getFavorites();

      verify(secureStorageRepositoryMock.getFavoritesItems()).called(1);

      expect(pokemonStore.favorites.length == 1, true);
    });
  });
}
