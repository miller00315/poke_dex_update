import 'package:equatable/equatable.dart';
import 'package:poke_dex/models/pokemon_model.dart';

class PokeListModel extends Equatable {
  final List<PokemonModel>? pokemonList;

  const PokeListModel({required this.pokemonList});

  PokeListModel.fromJson(Map<String, dynamic> json)
      : pokemonList = <PokemonModel>[] {
    if (json['pokemon'] != null) {
      json['pokemon'].forEach((pokemon) {
        pokemonList!.add(PokemonModel.fromJson(pokemon));
      });
    }
  }

  @override
  List<Object?> get props => [
        pokemonList,
      ];

  @override
  String toString() => """
  PokeListModel {
    pokemonList: $pokemonList,
  }
  """;
}
