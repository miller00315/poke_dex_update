import 'package:equatable/equatable.dart';
import 'package:poke_dex/models/ability_model.dart';

class GameIndexModel extends Equatable {
  final int? gameIndex;
  final AbilityModel? version;

  const GameIndexModel({
    required this.gameIndex,
    required this.version,
  });

  GameIndexModel.fromJson(Map<String, dynamic> json)
      : gameIndex = json['game_index'],
        version = json['version'] != null
            ? AbilityModel.fromJson(json['version'])
            : null;

  @override
  List<Object?> get props => [
        gameIndex,
        version,
      ];

  @override
  String toString() => """
  GameIndexModel {
    gameIndex: $gameIndex,
    version: $version
  }
  """;
}
