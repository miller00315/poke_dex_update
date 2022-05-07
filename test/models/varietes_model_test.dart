import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/models/varietes_model.dart';

void main() {
  final faker = Faker();

  final Map<String, dynamic> json = {
    'is_default': Random().nextInt(10) % 2 == 0,
    'pokemon': {
      'name': faker.person.name(),
      'url': faker.internet.httpsUrl(),
    }
  };

  final Map<String, dynamic> jsonWithoutPokemon = {
    'is_default': Random().nextInt(10) % 2 == 0,
  };

  group("variestiesModel group", () {
    test('should return a variestiesModelModel from json', () {
      final varietiesModel = VarietiesModel.fromJson(json);

      expect(
        varietiesModel.isDefault,
        json['is_default'],
        reason: 'is_default doesn\'t match',
      );

      expect(varietiesModel.pokemon!.name, json['pokemon']['name']);

      expect(varietiesModel.pokemon!.url, json['pokemon']['url']);
    });

    test('should return a variestiesModelModel from json without pokemon', () {
      final varietiesModel = VarietiesModel.fromJson(jsonWithoutPokemon);

      expect(
        varietiesModel.isDefault,
        jsonWithoutPokemon['is_default'],
        reason: 'without area is_default doesn\'t match',
      );

      expect(varietiesModel.pokemon, null);
    });
  });
}
