import 'package:equatable/equatable.dart';

class EvolutionChain extends Equatable {
  final String? url;

  const EvolutionChain({required this.url});

  EvolutionChain.fromJson(Map<String, dynamic> json) : url = json['url'];

  @override
  List<Object?> get props => [
        url,
      ];

  @override
  String toString() => '''
  EvolutionChain {
    url: $url
  }
  ''';
}
