import 'package:equatable/equatable.dart';
import 'package:poke_dex/models/abilities_model.dart';
import 'package:poke_dex/models/game_index_model.dart';
import 'package:poke_dex/models/stat_model.dart';
import 'package:poke_dex/models/type_model.dart';

import 'ability_model.dart';
import 'move_model.dart';

class PokemonDetailModel extends Equatable {
  final List<AbilitiesModel>? abilities;
  final int? baseExperience;
  final List<GameIndexModel>? gameIndices;
  // final List<Null>? heldItems;
  final int? height;
  final int? id;
  final bool? isDefault;
  final String? locationAreaEncounters;
  final List<MoveModel>? moves;
  final String? name;
  final int? order;
  final AbilityModel? species;
  final List<StatModel>? stats;
  final List<TypeModel>? types;
  final int? weight;

  const PokemonDetailModel({
    this.abilities,
    this.baseExperience,
    this.gameIndices,
    // this.heldItems,
    this.height,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.species,
    this.stats,
    this.types,
    this.weight,
  });

  PokemonDetailModel.fromJson(Map<String, dynamic> json)
      : abilities = <AbilitiesModel>[],
        baseExperience = json['base_experience'],
        gameIndices = <GameIndexModel>[],
        height = json['height'],
        id = json['id'],
        isDefault = json['is_default'],
        locationAreaEncounters = json['location_area_encounters'],
        moves = <MoveModel>[],
        name = json['name'],
        order = json['order'],
        species = json['species'] != null
            ? AbilityModel.fromJson(json['species'])
            : null,
        stats = <StatModel>[],
        types = <TypeModel>[],
        weight = json['weight'] {
    if (json['abilities'] != null) {
      json['abilities'].forEach((ability) {
        abilities!.add(AbilitiesModel.fromJson(ability));
      });
    }

    if (json['game_indices'] != null) {
      json['game_indices'].forEach((gameIndex) {
        gameIndices!.add(GameIndexModel.fromJson(gameIndex));
      });
    }

    if (json['moves'] != null) {
      json['moves'].forEach((move) {
        moves!.add(MoveModel.fromJson(move));
      });
    }

    if (json['stats'] != null) {
      json['stats'].forEach((stat) {
        stats!.add(StatModel.fromJson(stat));
      });
    }

    if (json['types'] != null) {
      json['types'].forEach((type) {
        types!.add(TypeModel.fromJson(type));
      });
    }
  }

  @override
  List<Object?> get props => [
        baseExperience,
        gameIndices,
        height,
        id,
        isDefault,
        locationAreaEncounters,
        moves,
        name,
        order,
        species,
        stats,
        types,
        weight,
      ];

  @override
  String toString() => """
  PokemonDetailModel {
    baseExperience: $baseExperience
    gameIndices: $gameIndices
    height: $height
    id: $id
    isDefault: $isDefault
    locationAreaEncounters: $locationAreaEncounters
    moves: $moves
    name: $name
    order: $order
    species: $species
    stats: $stats
    types: $types
    weight: $weight
  }
  """;
}
