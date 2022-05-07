import 'package:equatable/equatable.dart';
import 'package:poke_dex/models/ability_model.dart';

class AbilitiesModel extends Equatable {
  final AbilityModel? ability;
  final bool? isHidden;
  final int? slot;

  const AbilitiesModel({
    required this.ability,
    required this.isHidden,
    required this.slot,
  }) : super();

  AbilitiesModel.fromJson(Map<String, dynamic> json)
      : ability = json['ability'] != null
            ? AbilityModel.fromJson(json['ability'])
            : null,
        isHidden = json['isHidden'],
        slot = json['slot'];

  @override
  List<Object?> get props => [
        ability,
        isHidden,
        slot,
      ];

  @override
  String toString() => """
  AbilitiesModel {
    ability: $ability,
    isHidden: $isHidden,
    slot: $slot,
  }
  """;
}
