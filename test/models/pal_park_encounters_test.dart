import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/models/pal_park_encounters.dart';

void main() {
  final faker = Faker();

  final Map<String, dynamic> json = {
    'base_score': Random().nextInt(10),
    'rate': Random().nextInt(10),
    'area': {
      'name': faker.person.name(),
      'url': faker.internet.httpsUrl(),
    }
  };

  final Map<String, dynamic> jsonWithoutArea = {
    'base_score': Random().nextInt(10),
    'rate': Random().nextInt(10),
  };

  group("PalParkEncounters group", () {
    test('should return a PalParkEncountersModel from json', () {
      final palParkEncounters = PalParkEncounters.fromJson(json);

      expect(
        palParkEncounters.baseScore,
        json['base_score'],
        reason: 'baseScore doesn\'t match',
      );

      expect(
        palParkEncounters.rate,
        json['rate'],
        reason: 'rate doesn\'t match',
      );

      expect(palParkEncounters.area!.name, json['area']['name']);

      expect(palParkEncounters.area!.url, json['area']['url']);
    });

    test('should return a PalParkEncountersModel from json without area', () {
      final palParkEncounters = PalParkEncounters.fromJson(jsonWithoutArea);

      expect(
        palParkEncounters.baseScore,
        jsonWithoutArea['base_score'],
        reason: 'without area baseScore doesn\'t match',
      );

      expect(
        palParkEncounters.rate,
        jsonWithoutArea['rate'],
        reason: 'without area rate doesn\'t match',
      );

      expect(palParkEncounters.area, null);
    });
  });
}
