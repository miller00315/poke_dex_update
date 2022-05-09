import 'package:get_it/get_it.dart';
import 'package:poke_dex/injector/repositories/mock/repositories_mock_injector.dart';
import 'package:poke_dex/injector/repositories/release/repositories_release_injector.dart';
import 'package:poke_dex/injector/services/services_injector.dart';
import 'package:poke_dex/injector/stores_injector/stores_injector.dart';

final serviceLocator = GetIt.instance;

enum RepositoryInjector { UseMock, UseApi }

Future<void> init({
  RepositoryInjector repositoryInjector = RepositoryInjector.UseApi,
}) async {
  storesInjector(serviceLocator);
  servicesInjector(serviceLocator);

  (repositoryInjector == RepositoryInjector.UseApi)
      ? repositoriesReleaseInjector(serviceLocator)
      : repositoriesMockInjector(serviceLocator);
}
