import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:poke_dex/mock/fake_data/pokemon_fake_data.dart';
import 'package:poke_dex/pages/home_page/widgets/poke_item/poke_item.dart';
import 'package:poke_dex/stores/pokemon/pokemon_store.dart';
import 'package:flutter/material.dart';

import '../../../../stores/pokemon/pokemon_store_test.mocks.dart';

void main() {
  final pokemonRepositoryMock = MockPokemonRepositoryMock();
  final secureStorageRepositoryMock = MockSecureStorageRepositoryMock();

  final PokemonStore pokemonStore =
      PokemonStore(pokemonRepositoryMock, secureStorageRepositoryMock);

  final pokemon = PokemonFakeData.pokemonList.first;
  group('PokeItem group', () {
    Widget createWidgetForTesting() => MaterialApp(
          home: Material(
            child: PokeItem(
              pokemon: pokemon,
              index: 0,
              pokemonStore: pokemonStore,
            ),
          ),
        );

    testWidgets('should render a PokeItem widget', (WidgetTester tester) async {
      mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(createWidgetForTesting());

          expect(
            find.text(pokemon.name!),
            findsOneWidget,
          );

          expect(find.byType(Icon), findsNothing);
        },
      );
    });

    testWidgets('should render a PokeItem widget with favorite icons',
        (WidgetTester tester) async {
      mockNetworkImagesFor(
        () async {
          pokemonStore.favorites = [pokemon.id!];

          await tester.pumpWidget(createWidgetForTesting());

          expect(
            find.text(pokemon.name!),
            findsOneWidget,
          );

          expect(find.byType(Icon), findsOneWidget);
        },
      );
    });
  });
}
