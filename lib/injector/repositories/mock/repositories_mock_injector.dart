import 'package:get_it/get_it.dart';
import 'package:poke_dex/domain/repositories/pokemon_repository.dart';
import 'package:poke_dex/domain/repositories/pokemon_v2_repository.dart';
import 'package:poke_dex/domain/repositories/secure_storage_repository.dart';
import 'package:poke_dex/mock/repositories/pokemon_repository_mock.dart';
import 'package:poke_dex/mock/repositories/pokemon_v2_repository_mock.dart';
import 'package:poke_dex/mock/repositories/secure_storage_repository_mock.dart';

void repositoriesMockInjector(GetIt serviceLocator) {
  serviceLocator.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryMock(),
  );

  serviceLocator.registerLazySingleton<PokemonV2Repository>(
    () => PokemonV2RepositoryMock(),
  );

  serviceLocator.registerLazySingleton<SecureStorageRepository>(
    () => SecureStorageRepositoryMock(),
  );
}
