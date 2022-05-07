import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poke_dex/injector/main.dart';
import 'package:poke_dex/stores/pokemon/pokemon_store.dart';
import 'package:poke_dex/widgets/layout/poke_item_types.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class DetailsPage extends StatefulWidget {
  final int index;
  final PokemonStore? pokemonStore;

  const DetailsPage({
    Key? key,
    required this.index,
    this.pokemonStore,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  PageController? _pageController;
  PokemonStore? _pokemonStore;

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

    _progress = 0;
    _multiple = 1;
    _opacity = 1;
    _opacityTitleAppBar = 0;
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
                      AppBar(
                        centerTitle: true,
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        leading: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        actions: [
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            child: Container(
                              color: Colors.white,
                              height: 50,
                              width: 50,
                            ),
                            opacity: _opacityTitleAppBar! >= 0.2 ? 0.2 : 0.0,
                          ),
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
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
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                PokeItemTypes(
                                  types: _pokemonStore!.currentPokemon!.type,
                                  fontSize: 14,
                                  width: 8,
                                  height: 8,
                                ),
                                Text(
                                  '#' +
                                      _pokemonStore!.currentPokemon!.num
                                          .toString(),
                                  style: const TextStyle(
                                    //fontFamily: 'Google',
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SlidingSheet(
              listener: (state) => setState(() {
                _progress = state.progress;

                _multiple = 1 -
                    interval(
                      0.60,
                      0.87,
                      _progress,
                    );

                _opacity = _multiple;

                _opacityTitleAppBar = interval(
                  0.60,
                  0.87,
                  _progress,
                );
              }),
              elevation: 0,
              cornerRadius: 30,
              snapSpec: const SnapSpec(
                snap: true,
                snappings: [0.60, 0.87],
                positioning: SnapPositioning.relativeToAvailableSpace,
              ),
              builder: (context, state) {
                return Container(
                  height: height - height * 0.12,
                  child: Container(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
