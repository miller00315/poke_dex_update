import 'package:http/http.dart' show Client;

class PokemonV2Service {
  Client client = Client();

  PokemonV2Service({Client? client}) {
    if (client != null) {
      this.client = client;
    }
  }

  Future<dynamic> fetchPokemonDetails(String name) async => client.get(
        Uri.https(
          "pokeapi.co",
          '/api/v2/pokemon/$name',
        ),
      );

  Future<dynamic> fetchSpecie(String number) async => client.get(
        Uri.https(
          'pokeapi.co',
          'api/v2/pokemon-species/$number',
        ),
      );
}
