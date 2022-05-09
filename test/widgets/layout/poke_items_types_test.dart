import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/widgets/layout/poke_item_types.dart';

void main() {
  final faker = Faker();

  group('PokeItem group', () {
    Widget createWidgetForTesting(List<String> pokemonTypes) => MaterialApp(
          home: Material(
            child: PokeItemTypes(
              types: pokemonTypes,
              shouldTranslate: false,
            ),
          ),
        );

    testWidgets('should render a PokeItemTypes widget',
        (WidgetTester tester) async {
      final types = [
        faker.person.name(),
        faker.person.name(),
      ];

      await tester.pumpWidget(
        createWidgetForTesting(types),
      );

      for (final type in types) {
        expect(find.text(type), findsOneWidget);
      }
    });
  });
}
