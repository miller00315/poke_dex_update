import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/models/pokedex_numbers_model.dart';

void main() {
  final faker = Faker();

  final Map<String, dynamic> json = {
    'entry_number': Random().nextInt(10),
    'pokedex': {
      'name': faker.person.name(),
      'url': faker.internet.httpsUrl(),
    }
  };

  final Map<String, dynamic> jsonWithoutPokedex = {
    'base_score': Random().nextInt(10),
    'rate': Random().nextInt(10),
  };

  group("PokedexNumbers group", () {
    test('should return a PokedexNumbersModel from json', () {
      final pokedexNumbers = PokedexNumbers.fromJson(json);

      expect(
        pokedexNumbers.entryNumber,
        json['entry_number'],
        reason: 'entry_number doesn\'t match',
      );

      expect(pokedexNumbers.pokedex!.name, json['pokedex']['name']);

      expect(pokedexNumbers.pokedex!.url, json['pokedex']['url']);
    });

    test('should return a PokedexNumbersModel from json without pokeDex', () {
      final pokedexNumbers = PokedexNumbers.fromJson(jsonWithoutPokedex);

      expect(
        pokedexNumbers.entryNumber,
        jsonWithoutPokedex['entry_number'],
        reason: 'without area entry_number doesn\'t match',
      );

      expect(pokedexNumbers.pokedex, null);
    });
  });
}
