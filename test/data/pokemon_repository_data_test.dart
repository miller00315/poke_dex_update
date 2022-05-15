import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_dex/data/repositories/pokemon_repository_data.dart';
import 'package:poke_dex/mock/fake_data/pokemon_fake_data.dart';
import 'package:poke_dex/services/pokemon_service.dart';

import 'pokemon_repository_data_test.mocks.dart';

@GenerateMocks([PokemonService])
void main() {
  final pokemonServiceMock = MockPokemonService();

  final pokemonRepository = PokemonRepositoryData(pokemonServiceMock);

  const JsonEncoder encoder = JsonEncoder.withIndent('  ');

  group('PokemonRepositoryData group', () {
    test('should return a pokemon list', () async {
      when(pokemonServiceMock.fetchPokemonList()).thenAnswer(
        (realInvocation) => Future.value(
          HttpFakeResponse(
            body: encoder.convert(PokemonFakeData.pokeList.toJson()),
          ),
        ),
      );

      var result = await pokemonRepository.fetchPokemonList();

      expect(result, PokemonFakeData.pokeList);
    });
  });
}
