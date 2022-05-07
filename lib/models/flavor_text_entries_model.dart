import 'package:equatable/equatable.dart';

import 'obj_pokemon_model.dart';

class FlavorTextEntriesModel extends Equatable {
  final String? flavorText;
  final ObjPokemon? language;
  final ObjPokemon? version;

  const FlavorTextEntriesModel({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  FlavorTextEntriesModel.fromJson(Map<String, dynamic> json)
      : flavorText = json['flavor_text'],
        language = json['language'] != null
            ? ObjPokemon.fromJson(json['language'])
            : null,
        version = json['version'] != null
            ? ObjPokemon.fromJson(json['version'])
            : null;

  @override
  List<Object?> get props => [
        flavorText,
        language,
        version,
      ];

  @override
  String toString() => '''
  FlavorTextEntriesModel {
    flavorText: $flavorText,
    language: $language,
    version: $version,
  }
  ''';
}
