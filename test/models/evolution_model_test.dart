import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/models/evolution_model.dart';

void main() {
  final faker = Faker();

  final Map<String, dynamic> json = {
    "num": faker.person.name(),
    "name": faker.person.name(),
  };

  group('EvolutionModelGroup', () {
    test("should return a EvolutionGroupModel from a json", () {
      final evolutionModel = EvolutionModel.fromJson(json);

      expect(
        evolutionModel.name,
        json['name'],
        reason: 'name doesn\'t match',
      );

      expect(
        evolutionModel.number,
        json['num'],
        reason: 'number doesn\'t match',
      );
    });
  });
}
