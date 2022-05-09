import 'package:equatable/equatable.dart';

import 'evolution_model.dart';

class PokemonModel extends Equatable {
  final int? id;
  final String? num;
  final String? name;
  final String? img;
  final List<String>? type;
  final String? height;
  final String? weight;
  final String? candy;
  final String? egg;
  final List<EvolutionModel>? nextEvolution;
  final List<EvolutionModel>? prevEvolution;

  const PokemonModel({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.egg,
    required this.nextEvolution,
    required this.prevEvolution,
  });

  PokemonModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        num = json['num'],
        name = json['name'],
        img = json['img'],
        type = json['type'].cast<String>(),
        height = json['height'],
        weight = json['weight'],
        candy = json['candy'],
        egg = json['egg'],
        nextEvolution = <EvolutionModel>[],
        prevEvolution = <EvolutionModel>[] {
    if (json['next_evolution'] != null) {
      json['next_evolution'].forEach((evolution) {
        nextEvolution!.add(EvolutionModel.fromJson(evolution));
      });
    }
    if (json['prev_evolution'] != null) {
      json['prev_evolution'].forEach((evolution) {
        prevEvolution!.add(EvolutionModel.fromJson(evolution));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'id': id,
      'num': num,
      'name': name,
      'img': img,
      'type': type,
      'height': height,
      'weight': weight,
      'candy': candy,
      'egg': egg
    };

    if (nextEvolution != null) {
      data['next_evolution'] =
          nextEvolution!.map((next) => next.toJson()).toList();
    }
    if (prevEvolution != null) {
      data['prev_evolution'] =
          prevEvolution!.map((prev) => prev.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        num,
        name,
        img,
        type,
        height,
        weight,
        candy,
        egg,
        nextEvolution,
        prevEvolution,
      ];

  @override
  String toString() => """
  PokemonModel {
    id: $id
    num: $num
    name: $name
    img: $img
    type: $type
    height: $height
    weight: $weight
    candy: $candy
    egg: $egg
    nextEvolution: $nextEvolution
    prevEvolution: $prevEvolution
  }
  """;
}
