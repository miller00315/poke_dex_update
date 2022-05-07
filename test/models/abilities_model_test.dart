import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/models/abilities_model.dart';

void main() {
  final faker = Faker();
  
  final Map<String, dynamic> json = {
    'isHidden': true,
    'slot':  Random().nextInt(10),
    'ability': {
      'name': faker.person.name(),
      'url': faker.internet.httpsUrl(),
    }
  };

  group("Abilities model test", () {
    test(
      'should return a ability model from a json',
      () {
        final abilityModel = AbilitiesModel.fromJson(json);

        expect(
          abilityModel.isHidden,
          json['isHidden'],
          reason: 'IsHidden doesn\'t are equals',
        );

        expect(
          abilityModel.slot,
          json['slot'],
          reason: 'slot doesn\'t equals',
        );

        expect(abilityModel.ability == null, false);

        expect(
          abilityModel.ability!.name,
          json['ability']['name'],
          reason: 'ability.name doesn\'t are equals',
        );

        expect(
          abilityModel.ability!.url,
          json['ability']['url'],
          reason: 'ability.url doesn\'t equals',
        );
      },
    );
  });
}
