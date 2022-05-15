import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poke_dex/config/consts/app_text.dart';
import 'package:poke_dex/config/consts/font_sizes.dart';
import 'package:poke_dex/config/consts/images.dart';
import 'package:poke_dex/config/consts/images_size.dart';
import 'package:poke_dex/domain/entities/status_entity.dart';
import 'package:poke_dex/injector/main.dart';
import 'package:poke_dex/pages/details_page/details_page.dart';
import 'package:poke_dex/pages/home_page/widgets/home_page_app_bar.dart';
import 'package:poke_dex/pages/home_page/widgets/home_page_body.dart';
import 'package:poke_dex/stores/pokemon/pokemon_store.dart';
import 'package:poke_dex/widgets/layout/double_tap_to_close_app.dart';
import 'package:poke_dex/widgets/layout/error_page.dart';

import '../../models/pokemon_model.dart';

/// Página principal do app
class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PokemonStore _pokemonStore = serviceLocator<PokemonStore>();

  @override
  void initState() {
    super.initState();

    if (_pokemonStore.pokeList == null) {
      _pokemonStore.fetchPokemonList();
    }

    if (_pokemonStore.favorites.isEmpty) {
      _pokemonStore.getFavorites();
    }
  }

  void _handlePokemonTap({
    required PokemonModel pokemon,
    required int index,
  }) {
    _pokemonStore.setCurrentPokemon(index: index);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          index: index,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DoubleTapToCloseApp(
        snackBar: const SnackBar(
          content: Text(
            AppText.doubleTapCloseAppMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: FontSizes.small,
              color: Colors.white,
            ),
          ),
          margin: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          backgroundColor: Colors.black87,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 4),
        ),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Positioned(
              top: MediaQuery.of(context).padding.top -
                  ImagesSize.extraLarge / 2.9,
              left: MediaQuery.of(context).size.width -
                  (ImagesSize.extraLarge / 1.6),
              child: Opacity(
                child: Image.asset(
                  Images.blackPokeBall,
                  height: ImagesSize.extraLarge,
                  width: ImagesSize.extraLarge,
                ),
                opacity: 0.2,
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  const HomePageAppBar(),
                  Expanded(
                    child: Observer(
                      builder: (_) {
                        switch (_pokemonStore.fetchStatus.runtimeType) {
                          case InProgressStatus:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );

                          case DoneStatus:
                            return HomePageBody(
                              pokemons: _pokemonStore.pokeList!.pokemonList,
                              handlePokemonItemClicked: _handlePokemonTap,
                            );

                          case ErrorStatus:
                            return const ErrorPage();

                          default:
                            return const Center(
                              child: Text('ocioso'),
                            );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
