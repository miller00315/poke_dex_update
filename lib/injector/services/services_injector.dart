import 'package:get_it/get_it.dart';
import 'package:poke_dex/services/pokemon_service.dart';
import 'package:poke_dex/services/pokemon_v2_service.dart';

void servicesInjector(GetIt serviceLocator) {
  serviceLocator.registerLazySingleton<PokemonService>(
    () => PokemonService(),
  );

  serviceLocator.registerLazySingleton<PokemonV2Service>(
    () => PokemonV2Service(),
  );
}
