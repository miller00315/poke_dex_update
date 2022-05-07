import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/models/names_model.dart';

void main() {
  final faker = Faker();

  final Map<String, dynamic> json = {
    'language': {
      'name': faker.person.name(),
      'url': faker.internet.httpsUrl(),
    },
    'name': faker.person.name()
  };

  final Map<String, dynamic> jsonWithoutLanguage = {
    'name': faker.person.name()
  };

  group("NamesModel group", () {
    test('should return a NamesModel from json', () {
      final names = Names.fromJson(json);
      
      expect(names.name, json['name']);

      expect(names.language!.name, json['language']['name']);

      expect(names.language!.url, json['language']['url']);
    });

    test('should return a NamesModel from json without language', () {
      final names = Names.fromJson(jsonWithoutLanguage);

      expect(names.name, jsonWithoutLanguage['name']);

      expect(names.language, null);
    });
  });
}
