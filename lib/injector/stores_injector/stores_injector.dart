import 'package:get_it/get_it.dart';
import 'package:poke_dex/stores/pokemon/pokemon_store.dart';
import 'package:poke_dex/stores/pokemon/pokemon_v2_store.dart';

void storesInjector(GetIt serviceLocator) {
  serviceLocator.registerLazySingleton<PokemonStore>(
    () => PokemonStore(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<PokemonV2Store>(
    () => PokemonV2Store(
      serviceLocator(),
    ),
  );
}
