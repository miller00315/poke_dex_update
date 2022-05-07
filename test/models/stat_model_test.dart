import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/models/stat_model.dart';

void main() {
  final faker = Faker();

  final Map<String, dynamic> json = {
    'base_stat': Random().nextInt(10),
    'effort': Random().nextInt(10),
    'stat': {
      'name': faker.person.name(),
      'url': faker.internet.httpsUrl(),
    }
  };

  final Map<String, dynamic> jsonWithoutStat = {
    'base_stat': Random().nextInt(10),
    'effort': Random().nextInt(10),
  };

  group("StatModel group", () {
    test('should return a StatModelModel from json', () {
      final statModel = StatModel.fromJson(json);

      expect(
        statModel.baseStat,
        json['base_stat'],
        reason: 'baseScore doesn\'t match',
      );

      expect(
        statModel.effort,
        json['effort'],
        reason: 'effort doesn\'t match',
      );

      expect(statModel.stat!.name, json['stat']['name']);

      expect(statModel.stat!.url, json['stat']['url']);
    });

    test('should return a StatModelModel from json without stat', () {
      final statModel = StatModel.fromJson(jsonWithoutStat);

      expect(
        statModel.baseStat,
        jsonWithoutStat['base_stat'],
        reason: 'without stat baseScore doesn\'t match',
      );

      expect(
        statModel.effort,
        jsonWithoutStat['effort'],
        reason: 'without stat effort doesn\'t match',
      );

      expect(statModel.stat, null);
    });
  });
}
