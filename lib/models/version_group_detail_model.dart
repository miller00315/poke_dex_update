import 'package:equatable/equatable.dart';
import 'package:poke_dex/models/ability_model.dart';

class VersionGroupDetailModel extends Equatable {
  final int? levelLearnedAt;
  final AbilityModel? moveLearnMethod;
  final AbilityModel? versionGroup;

  const VersionGroupDetailModel({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  VersionGroupDetailModel.fromJson(Map<String, dynamic> json)
      : levelLearnedAt = json['level_learned_at'],
        moveLearnMethod = json['move_learn_method'] != null
            ? AbilityModel.fromJson(json['move_learn_method'])
            : null,
        versionGroup = json['version_group'] != null
            ? AbilityModel.fromJson(json['version_group'])
            : null;

  @override
  List<Object?> get props => [
        levelLearnedAt,
        moveLearnMethod,
        versionGroup,
      ];

  @override
  String toString() => '''
  VersionGroupDetailModel {
    levelLearnedAt: $levelLearnedAt,
    moveLearnMethod: $moveLearnMethod,
    versionGroup: $versionGroup,
  }
  ''';
}
