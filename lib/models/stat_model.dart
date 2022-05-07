import 'package:equatable/equatable.dart';

import 'ability_model.dart';

class StatModel extends Equatable {
  final int? baseStat;
  final int? effort;
  final AbilityModel? stat;

  const StatModel({
    this.baseStat,
    this.effort,
    this.stat,
  });

  StatModel.fromJson(Map<String, dynamic> json)
      : baseStat = json['base_stat'],
        effort = json['effort'],
        stat =
            json['stat'] != null ? AbilityModel.fromJson(json['stat']) : null;

  @override
  List<Object?> get props => [
        baseStat,
        effort,
        stat,
      ];

  @override
  String toString() => '''
  StatModel{
    baseStat: $baseStat,
    effort: $effort,
    stat: $stat,
  }
  ''';
}
