import 'package:get_it/get_it.dart';
import 'package:poke_dex/data/repositories/pokemon_repository_data.dart';
import 'package:poke_dex/data/repositories/pokemon_v2_repository_data.dart';
import 'package:poke_dex/data/repositories/secure_storage_repository_data.dart';
import 'package:poke_dex/domain/repositories/pokemon_repository.dart';
import 'package:poke_dex/domain/repositories/pokemon_v2_repository.dart';
import 'package:poke_dex/domain/repositories/secure_storage_repository.dart';

void repositoriesReleaseInjector(GetIt serviceLocator) {
  serviceLocator.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryData(serviceLocator()),
  );

  serviceLocator.registerFactory<PokemonV2Repository>(
    () => PokemonV2RepositoryData(serviceLocator()),
  );

  serviceLocator.registerLazySingleton<SecureStorageRepository>(
    () => SecureStorageRepositoryData(),
  );
}
