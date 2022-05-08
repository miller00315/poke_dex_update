import 'package:get_it/get_it.dart';
import 'package:poke_dex/data/secure_storage_repository_data.dart';
import 'package:poke_dex/domain/repositories/secure_storage_repository.dart';
import 'package:poke_dex/injector/repositories/mock/repositories_mock_injector.dart';
import 'package:poke_dex/injector/repositories/release/repositories_release_injector.dart';
import 'package:poke_dex/injector/storesInjector/storesInjector.dart';

final serviceLocator = GetIt.instance;

enum RepositoryInjector { UseMock, UseApi }

Future<void> init({
  RepositoryInjector repositoryInjector = RepositoryInjector.UseApi,
}) async {
  storesInjector(serviceLocator);
  (repositoryInjector == RepositoryInjector.UseApi)
      ? repositoriesReleaseInjector(serviceLocator)
      : repositoriesMockInjector(serviceLocator);
}
