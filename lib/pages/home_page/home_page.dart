import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poke_dex/domain/entities/status_entity.dart';
import 'package:poke_dex/injector/main.dart';
import 'package:poke_dex/pages/details/details_page.dart';
import 'package:poke_dex/pages/home_page/widgets/home_page_app_bar.dart';
import 'package:poke_dex/pages/home_page/widgets/home_page_body.dart';
import 'package:poke_dex/stores/pokemon/pokemon_store.dart';
import 'package:poke_dex/widgets/shadows/top_overflow_shadow.dart';

import '../../models/pokemon_model.dart';

class HomePage extends StatefulWidget {
  final PokemonStore? pokemonStoreTest;

  const HomePage({
    Key? key,
    this.pokemonStoreTest,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokemonStore? _pokemonStore;

  @override
  void initState() {
    super.initState();

    _pokemonStore = widget.pokemonStoreTest ?? serviceLocator<PokemonStore>();

    if (_pokemonStore!.pokeList == null) {
      _pokemonStore!.fetchPokemonList();
    }

    if (_pokemonStore!.favorites.isEmpty) {
      _pokemonStore!.getFavorites();
    }
  }

  void _handlePokemonTap({
    required PokemonModel pokemon,
    required int index,
  }) {
    _pokemonStore!.setCurrentPokemon(index: index);

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 122),
              child: Column(
                children: [
                  Expanded(
                    child: Observer(
                      builder: (_) {
                        switch (_pokemonStore!.fetchStatus.runtimeType) {
                          case InProgressStatus:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );

                          case DoneStatus:
                            return Column(
                              children: [
                                Expanded(
                                  child: TopOverflowShadow(
                                    child: HomePageBody(
                                      pokemons:
                                          _pokemonStore!.pokeList!.pokemonList,
                                      handlePokemonItemClicked:
                                          _handlePokemonTap,
                                    ),
                                  ),
                                ),
                              ],
                            );

                          case ErrorStatus:
                            return const Center(
                              child: Text('Deu ruim'),
                            );

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
            const HomePageAppBar(),
          ],
        ),
      ),
    );
  }
}
