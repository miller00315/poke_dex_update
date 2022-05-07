import 'package:equatable/equatable.dart';

import 'obj_pokemon_model.dart';

class GeneraModel extends Equatable {
  final String? genus;
  final ObjPokemon? language;

  const GeneraModel({this.genus, this.language});

  GeneraModel.fromJson(Map<String, dynamic> json)
      : genus = json['genus'],
        language = json['language'] != null
            ? ObjPokemon.fromJson(json['language'])
            : null;

  @override
  List<Object?> get props => [
        genus,
        language,
      ];

  @override
  String toString() => '''
  GeneraModel {
    genus: $genus
    language: $language
  }
  ''';
}
