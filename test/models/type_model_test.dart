import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/models/type_model.dart';

void main() {
  final faker = Faker();

  final Map<String, dynamic> json = {
    'slot': Random().nextInt(10),
    'type': {
      'name': faker.person.name(),
      'url': faker.internet.httpsUrl(),
    }
  };

  final Map<String, dynamic> jsonWithoutTypes = {
    'slot': Random().nextInt(10),
  };

  group("type group", () {
    test('should return a typeModel from json', () {
      final typeModel = TypeModel.fromJson(json);

      expect(
        typeModel.slot,
        json['slot'],
        reason: 'slot doesn\'t match',
      );

      expect(typeModel.type!.name, json['type']['name']);

      expect(typeModel.type!.url, json['type']['url']);
    });

    test('should return a typeModel from json without type', () {
      final typeModel = TypeModel.fromJson(jsonWithoutTypes);

      expect(
        typeModel.slot,
        jsonWithoutTypes['slot'],
        reason: 'without area slot doesn\'t match',
      );

      expect(typeModel.type, null);
    });
  });
}
