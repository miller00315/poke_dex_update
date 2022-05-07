import 'package:equatable/equatable.dart';

import 'ability_model.dart';

class TypeModel extends Equatable {
  final int? slot;
  final AbilityModel? type;

  const TypeModel({this.slot, this.type});

  TypeModel.fromJson(Map<String, dynamic> json)
      : slot = json['slot'],
        type =
            json['type'] != null ? AbilityModel.fromJson(json['type']) : null;

  @override
  List<Object?> get props => [
        slot,
        type,
      ];

  @override
  String toString() => '''
  TypeModel {
    slot: $slot,
    type: $type,
  }
  ''';
}
