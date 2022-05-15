import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poke_dex/app.dart';
import 'package:poke_dex/utils/change_status_bar_color.dart';
import 'dart:developer' as developer;

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
    repositoryInjector: injector.RepositoryInjector.useApi,
  );

  //print(Env().apiUrl);

  // Set orientation of screen as only portrait up
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  changeStatusBarColor(statusBarColor: Colors.transparent);

  runZonedGuarded<Future<void>>(() async {
    runApp(const App());
  }, (Object e, StackTrace stackTrace) {
    developer.log(
      e.toString(),
      name: 'main.dart',
      error: stackTrace.toString(),
    );
  });
}
