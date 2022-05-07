import 'package:equatable/equatable.dart';

class AbilityModel extends Equatable {
  final String? name;
  final String? url;

  const AbilityModel({
    required this.name,
    required this.url,
  });

  AbilityModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];

  @override
  List<Object?> get props => [
        name,
        url,
      ];

  @override
  String toString() => """
  AbilityModel {
    name: $name,
    url: $url,
  }
  """;
}
