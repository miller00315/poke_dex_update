import 'package:flutter/material.dart';
import 'package:poke_dex/pages/home_page/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Google',
        brightness: Brightness.light,
      ),
      home: const HomePage(),
      // ),
    );
  }
}
