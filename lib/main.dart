import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poke_dex/data/repositories/pokemon_repository_data.dart';
import 'package:poke_dex/data/repositories/secure_storage_repository_data.dart';
import 'package:poke_dex/domain/repositories/secure_storage_repository.dart';
import 'package:poke_dex/mock/repositories/pokemon_repository_mock.dart';
import 'package:poke_dex/pages/home_page/home_page.dart';
import 'package:poke_dex/services/pokemon_service.dart';
import 'package:poke_dex/utils/change_status_bar_color.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import 'domain/repositories/pokemon_repository.dart';
import 'injector/main.dart' as injector;
import 'stores/pokemon/pokemon_store.dart';

void main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (kDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      FlutterError.dumpErrorToConsole(details);
    }
  };

  await injector.init(
    repositoryInjector: injector.RepositoryInjector.UseApi,
  );

  //print(Env().apiUrl);

  // Set orientation of screen as only portrait up
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  changeStatusBarColor(statusBarColor: Colors.transparent);

  runZonedGuarded<Future<void>>(() async {
    runApp(const MyApp());
  }, (Object e, StackTrace stackTrace) {
    developer.log(
      e.toString(),
      name: 'main.dart',
      error: stackTrace.toString(),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// Estes providers são apenas par ateste e estudo
        Provider<PokemonService>(create: (context) => PokemonService()),
        Provider<PokemonRepository>(
          create: (context) => PokemonRepositoryData(
            Provider.of<PokemonService>(context),
          ),
        ),
        Provider<PokemonStore>(
          create: (context) => PokemonStore(
            Provider.of<PokemonRepository>(context),
            Provider.of<SecureStorageRepository>(context),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Poke dex',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Google',
          brightness: Brightness.light,
        ),
        home: const HomePage(),
      ),
    );
  }
}
