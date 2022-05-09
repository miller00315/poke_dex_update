import 'package:equatable/equatable.dart';

class EvolutionModel extends Equatable {
  final String? number;
  final String? name;

  const EvolutionModel({
    required this.number,
    required this.name,
  });

  EvolutionModel.fromJson(Map<String, dynamic> json)
      : number = json['num'],
        name = json['name'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'num': number,
      'name': name
    };

    return data;
  }

  @override
  List<Object?> get props => [
        number,
        name,
      ];

  @override
  String toString() => """
  EvolutionModel {
    number: $number,
    name: $name,
  }
  """;
}
