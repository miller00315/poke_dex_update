import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poke_dex/config/consts/urls.dart';
import 'package:poke_dex/injector/main.dart';
import 'package:poke_dex/models/pokemon_model.dart';
import 'package:poke_dex/pages/details/widgets/details_page_animated_image.dart';
import 'package:poke_dex/pages/details/widgets/details_page_app_bar.dart';
import 'package:poke_dex/pages/details/widgets/details_page_body.dart';
import 'package:poke_dex/pages/details/widgets/details_page_header.dart';
import 'package:poke_dex/stores/pokemon/pokemon_store.dart';
import 'package:poke_dex/stores/pokemon/pokemon_v2_store.dart';
import 'package:poke_dex/utils/string_replace.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class DetailsPage extends StatefulWidget {
  final int index;
  final PokemonStore? pokemonStore;
  final PokemonV2Store? pokemonV2Store;

  const DetailsPage({
    Key? key,
    required this.index,
    this.pokemonStore,
    this.pokemonV2Store,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  PageController? _pageController;

  PokemonStore? _pokemonStore;
  PokemonV2Store? _pokemonV2Store;

  late double _progress;
  double? _multiple;
  double? _opacity;
  double? _opacityTitleAppBar;

  @override
  void initState() {
    super.initState();

    _pageController =
        PageController(initialPage: widget.index, viewportFraction: 0.5);

    _pokemonStore = widget.pokemonStore ?? serviceLocator<PokemonStore>();

    _pokemonV2Store = widget.pokemonV2Store ?? serviceLocator<PokemonV2Store>();

    _pokemonV2Store!.fetchPokemonDetails(_pokemonStore!.currentPokemon!.name!);

    _pokemonV2Store!.fetchSpecie(_pokemonStore!.currentPokemon!.id!);

    _progress = 0;
    _multiple = 1;
    _opacity = 1;
    _opacityTitleAppBar = 0;
  }

  @override
  void dispose() {
    _pageController!.dispose();
    _pokemonV2Store!.dispose();

    super.dispose();
  }

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper) return 1.0;
    if (progress < lower) return 0.0;

    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }

  Future<bool> _onWillPop() {
    Navigator.of(context).pop(true);
    return Future.value(true);
  }

  _handleSheetStateChanged(SheetState state) {
    setState(() {
      _progress = state.progress;
      _multiple = 1 - interval(0.60, 0.87, _progress);
      _opacity = _multiple;
      _opacityTitleAppBar = interval(0.60, 0.87, _progress);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Stack(
          children: [
            Observer(
              builder: (context) {
                return AnimatedContainer(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        _pokemonStore!.pokemonColor!.withOpacity(0.7),
                        _pokemonStore!.pokemonColor!
                      ],
                    ),
                  ),
                  duration: const Duration(milliseconds: 300),
                  child: Stack(
                    children: [
                      DetailsPageAppBar(
                        opacityTitleAppBar: _opacityTitleAppBar ?? 0,
                      ),
                      Positioned(
                        top: height * 0.12 - _progress * (height * 0.060),
                        left: 20 + _progress * (height * 0.060),
                        child: Text(
                          _pokemonStore!.currentPokemon!.name!,
                          style: TextStyle(
                            fontSize: 38 - _progress * (height * 0.011),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.16,
                        child: DetailsPageHeader(
                          number: _pokemonStore!.currentPokemon!.num!,
                          types: _pokemonStore!.currentPokemon!.type!,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            DetailsPageBody(
              handleSheetStateChanged: _handleSheetStateChanged,
            ),
            Opacity(
              opacity: _opacity!,
              child: Padding(
                padding: EdgeInsets.only(
                    top: _opacityTitleAppBar == 1
                        ? 1000
                        : (height * 0.25) - _progress * 50),
                child: SizedBox(
                  height: 200,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (index) {
                      _pokemonStore!.setCurrentPokemon(index: index);

                      _pokemonV2Store!.fetchPokemonDetails(
                        _pokemonStore!.currentPokemon!.name!,
                      );

                      _pokemonV2Store!
                          .fetchSpecie(_pokemonStore!.currentPokemon!.id!);
                    },
                    itemCount: _pokemonStore!.pokeList!.pokemonList!.length,
                    itemBuilder: (context, index) => DetailsPageAnimatedImage(
                      index: index,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
