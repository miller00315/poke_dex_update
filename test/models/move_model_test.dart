import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/models/move_model.dart';

void main() {
  final faker = Faker();

  final Map<String, dynamic> json = {
    'move': {
      'name': faker.person.name(),
      'url': faker.internet.httpsUrl(),
    },
    'version_group_details': [
      {
        'level_learned_at': Random().nextInt(10),
        'move_learn_method': {
          'name': faker.person.name(),
          'url': faker.internet.httpsUrl(),
        },
        'version_group': {
          'name': faker.person.name(),
          'url': faker.internet.httpsUrl(),
        },
      }
    ],
  };

  final Map<String, dynamic> jsonWithoutData = {};

  group("MoveModel group", () {
    test('should return MoveMOdel from json', () {
      final moveModel = MoveModel.fromJson(json);

      expect(moveModel.move!.name, json['move']['name']);

      expect(moveModel.move!.url, json['move']['url']);

      expect(moveModel.versionGroupDetails!.length, 1);

      expect(moveModel.versionGroupDetails![0].moveLearnMethod!.name,
          json['version_group_details'][0]['move_learn_method']['name']);

      expect(moveModel.versionGroupDetails![0].moveLearnMethod!.url,
          json['version_group_details'][0]['move_learn_method']['url']);

      expect(moveModel.versionGroupDetails![0].versionGroup!.name,
          json['version_group_details'][0]['version_group']['name']);

      expect(moveModel.versionGroupDetails![0].versionGroup!.url,
          json['version_group_details'][0]['version_group']['url']);
    });

    test('should return MoveModel from json without content', () {
      final moveModel = MoveModel.fromJson(jsonWithoutData);

      expect(moveModel.move, null);

      expect(moveModel.versionGroupDetails!.length, 0);
    });
  });
}
