import 'package:http/http.dart' as http;

class PokemonV2Service {
  Future<http.Response> fetchPokemonDetails(String name) async =>
      http.get(
        Uri.https(
          "pokeapi.co",
          '/api/v2/pokemon/$name',
        ),
      );

  Future<http.Response> fetchSpecie(String number) async => http.get(
        Uri.https(
          'pokeapi.co',
          'api/v2/pokemon-species/$number',
        ),
      );
}
