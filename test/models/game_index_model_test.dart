import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/models/game_index_model.dart';

void main() {
  final faker = Faker();

  final Map<String, dynamic> json = {
    'game_index': Random().nextInt(10),
    'version': {
      'name': faker.person.name(),
      'url': faker.internet.httpsUrl(),
    }
  };

  final Map<String, dynamic> jsonWithoutVersion = {
    'game_index': Random().nextInt(10),
  };

  group('GameIndexModel group', () {
    test("should return a GameIndexModel from a json", () {
      final gameIndexModel = GameIndexModel.fromJson(json);

      expect(
        gameIndexModel.gameIndex,
        json['game_index'],
        reason: 'gameIndex doesn\'t match',
      );

      expect(gameIndexModel.version!.name, json['version']['name']);

      expect(gameIndexModel.version!.url, json['version']['url']);
    });

    test("should return a GameIndexModel from a json without version", () {
      final gameIndexModel = GameIndexModel.fromJson(jsonWithoutVersion);

      expect(
        gameIndexModel.gameIndex,
        jsonWithoutVersion['game_index'],
        reason: 'without version gameIndex doesn\'t match',
      );

      expect(gameIndexModel.version, null);
    });
  });
}
