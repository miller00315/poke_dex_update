import 'package:equatable/equatable.dart';

import 'obj_pokemon_model.dart';

class VarietiesModel extends Equatable {
  final bool? isDefault;
  final ObjPokemon? pokemon;

  const VarietiesModel({this.isDefault, this.pokemon});

  VarietiesModel.fromJson(Map<String, dynamic> json)
      : isDefault = json['is_default'],
        pokemon = json['pokemon'] != null
            ? ObjPokemon.fromJson(json['pokemon'])
            : null;

  @override
  List<Object?> get props => [
        isDefault,
        pokemon,
      ];

  @override
  String toString() => '''
  VarietiesModel {
    isDefault: $isDefault,
    pokemon: $pokemon,
  }
  ''';
}
