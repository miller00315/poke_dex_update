import 'package:equatable/equatable.dart';

import 'obj_pokemon_model.dart';

class Names extends Equatable {
  final ObjPokemon? language;
  final String? name;

  const Names({this.language, this.name});

  Names.fromJson(Map<String, dynamic> json)
      : language = json['language'] != null
            ? ObjPokemon.fromJson(json['language'])
            : null,
        name = json['name'];

  @override
  List<Object?> get props => [language, name];

  @override
  String toString() => '''
  Names {
    language: $language
    name: $name
  }
  ''';
}
