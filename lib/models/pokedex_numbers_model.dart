import 'package:equatable/equatable.dart';

import 'obj_pokemon_model.dart';

class PokedexNumbers extends Equatable {
  final int? entryNumber;
  final ObjPokemon? pokedex;

  const PokedexNumbers({this.entryNumber, this.pokedex});

  PokedexNumbers.fromJson(Map<String, dynamic> json)
      : entryNumber = json['entry_number'],
        pokedex = json['pokedex'] != null
            ? ObjPokemon.fromJson(json['pokedex'])
            : null;

  @override
  List<Object?> get props => [
        entryNumber,
        pokedex,
      ];

  @override
  String toString() => '''
  {
    entryNumber: $entryNumber,
    pokedex: $pokedex,
  }
  ''';
}
