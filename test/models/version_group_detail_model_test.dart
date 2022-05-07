import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/models/version_group_detail_model.dart';

void main() {
  var faker = Faker();

  final Map<String, dynamic> json = {
    'level_learned_at': 1,
    'move_learn_method': {
      'name': faker.person.name(),
      'url': faker.internet.httpsUrl(),
    },
    'version_group': {
      'name': faker.person.name(),
      'url': faker.internet.httpsUrl(),
    },
  };

  final Map<String, dynamic> jsonWithoutNesters = {
    'level_learned_at': 1,
  };

  group("VersionGroupDetailModel group", () {
    test('should return a VersionGroupDetailModel from a json', () {
      final versionGroupDetailModel = VersionGroupDetailModel.fromJson(json);

      expect(versionGroupDetailModel.levelLearnedAt, json['level_learned_at']);

      expect(versionGroupDetailModel.moveLearnMethod!.name,
          json['move_learn_method']['name']);

      expect(versionGroupDetailModel.moveLearnMethod!.url,
          json['move_learn_method']['url']);

      expect(versionGroupDetailModel.versionGroup!.name,
          json['version_group']['name']);

      expect(versionGroupDetailModel.versionGroup!.url,
          json['version_group']['url']);
    });

    test(
        'should return a VersionGroupDetailModel from a json without moveLearnMethod and versionGroup',
        () {
      final versionGroupDetailModel =
          VersionGroupDetailModel.fromJson(jsonWithoutNesters);

      expect(versionGroupDetailModel.levelLearnedAt, json['level_learned_at']);

      expect(versionGroupDetailModel.moveLearnMethod, null);

      expect(versionGroupDetailModel.versionGroup, null);
    });
  });
}
