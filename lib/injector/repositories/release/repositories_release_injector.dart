import 'package:get_it/get_it.dart';
import 'package:poke_dex/data/pokemon_repository_data.dart';
import 'package:poke_dex/data/pokemon_v2_repository_data.dart';
import 'package:poke_dex/domain/repositories/pokemon_repository.dart';
import 'package:poke_dex/domain/repositories/pokemon_v2_repository.dart';

void repositoriesReleaseInjector(GetIt serviceLocator) {
  serviceLocator.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryData(),
  );

  serviceLocator.registerFactory<PokemonV2Repository>(
    () => PokemonV2RepositoryData(),
  );
}
