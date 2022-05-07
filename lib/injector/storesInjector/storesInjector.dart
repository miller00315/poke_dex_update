import 'package:get_it/get_it.dart';
import 'package:poke_dex/stores/pokemon/pokemon_store.dart';

void storesInjector(GetIt serviceLocator) {
  serviceLocator.registerLazySingleton<PokemonStore>(
    () => PokemonStore(
      serviceLocator(),
    ),
  );
}
