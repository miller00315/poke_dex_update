import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/models/ability_model.dart';

void main() {
  final faker = Faker();
  
  final Map<String, dynamic> json = {
    'name': faker.person.name(),
    'url': faker.internet.httpsUrl(),
  };
  
  group("Ability model test", () {
    test(
      'should return a ability model from a json',
      () {
        final abilityModel = AbilityModel.fromJson(json);

        expect(
          abilityModel.name,
          json['name'],
          reason: 'Name doesn\'t are equals',
        );

        expect(
          abilityModel.url,
          json['url'],
          reason: 'Url doesn\'t equals',
        );
      },
    );
  });
}
