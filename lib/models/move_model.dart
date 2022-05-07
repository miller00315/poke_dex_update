import 'package:equatable/equatable.dart';
import 'package:poke_dex/models/ability_model.dart';
import 'package:poke_dex/models/version_group_detail_model.dart';

class MoveModel extends Equatable {
  final AbilityModel? move;
  final List<VersionGroupDetailModel>? versionGroupDetails;

  const MoveModel({this.move, this.versionGroupDetails});

  MoveModel.fromJson(Map<String, dynamic> json)
      : move =
            json['move'] != null ? AbilityModel.fromJson(json['move']) : null,
        versionGroupDetails = <VersionGroupDetailModel>[] {
    if (json['version_group_details'] != null) {
      json['version_group_details'].forEach(
        (versionGroupDetail) {
          versionGroupDetails!
              .add(VersionGroupDetailModel.fromJson(versionGroupDetail));
        },
      );
    }
  }

  @override
  List<Object?> get props => [
        move,
        versionGroupDetails,
      ];

  @override
  String toString() => """
  MoveModel {
    move: $move
    versionGroupDetails: $versionGroupDetails
  }
  """;
}
