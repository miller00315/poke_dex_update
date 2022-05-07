import 'package:equatable/equatable.dart';

import 'obj_pokemon_model.dart';

class PalParkEncounters extends Equatable {
  final ObjPokemon? area;
  final int? baseScore;
  final int? rate;

  const PalParkEncounters({
    this.area,
    this.baseScore,
    this.rate,
  });

  PalParkEncounters.fromJson(Map<String, dynamic> json)
      : area = json['area'] != null ? ObjPokemon.fromJson(json['area']) : null,
        baseScore = json['base_score'],
        rate = json['rate'];

  @override
  List<Object?> get props => [
        area,
        baseScore,
        rate,
      ];

  @override
  String toString() => '''
  PalParkEncounters {
    area: $area,
    baseScore: $baseScore,
    rate: $rate,
  }
  ''';
}
