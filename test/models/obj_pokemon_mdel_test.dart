import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/models/obj_pokemon_model.dart';

void main() {
  final Map<String, dynamic> json = {
    'name': 'test name',
    'url': 'tes.com',
  };
  group("ObjPokemon group", () {
    test('should return a ObjPokemon from a json', () {
      final objPokemon = ObjPokemon.fromJson(json);

      expect(objPokemon.name, json['name']);
      expect(objPokemon.url, json['url']);
    });
  });
}
