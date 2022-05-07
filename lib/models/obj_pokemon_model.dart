import 'package:equatable/equatable.dart';

class ObjPokemon extends Equatable {
  final String? name;
  final String? url;

  const ObjPokemon({this.name, this.url});

  ObjPokemon.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];

  @override
  List<Object?> get props => [
        name,
        url,
      ];

  @override
  String toString() => '''
  ObjPokemon {
    name: $name,
    url: $url
  }
  ''';
}
