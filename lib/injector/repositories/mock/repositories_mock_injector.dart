import 'package:get_it/get_it.dart';
import 'package:poke_dex/domain/repositories/pokemon_repository.dart';
import 'package:poke_dex/mock/pokemon_repository_mock.dart';

void repositoriesMockInjector(GetIt serviceLocator) {
  serviceLocator.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryMock(),
  );
}
