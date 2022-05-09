import 'package:http/http.dart' show Client;

class PokemonService {
  Client client = Client();

  PokemonService({Client? client}) {
    if (client != null) {
      this.client = client;
    }
  }

  Future<dynamic> fetchPokemonList() async => await client.get(
        Uri.https(
          'raw.githubusercontent.com',
          'Biuni/PokemonGO-Pokedex/master/pokedex.json',
        ),
      );
}
