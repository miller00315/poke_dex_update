import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:poke_dex/pages/home_page/home_page.dart';

import 'injector/main.dart' as injector;

void main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (kDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      FlutterError.dumpErrorToConsole(details);
    }
  };

  await injector.init(
    repositoryInjector: kDebugMode
        ? injector.RepositoryInjector.UseMock
        : injector.RepositoryInjector.UseApi,
  );

  //print(Env().apiUrl);

  // Set orientation of screen as only portrait up
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runZonedGuarded<Future<void>>(() async {
    runApp(const MyApp());
  }, (Object error, StackTrace stackTrace) {
    print(error);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
