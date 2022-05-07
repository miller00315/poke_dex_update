import 'package:http/http.dart' as http;

class PokemonService {
  static Future<http.Response> fetchPokemonList() async => await http.get(
        Uri.https(
          'raw.githubusercontent.com',
          'Biuni/PokemonGO-Pokedex/master/pokedex.json',
        ),
      );
}
