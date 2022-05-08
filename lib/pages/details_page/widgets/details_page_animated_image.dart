import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poke_dex/config/consts/images.dart';
import 'package:poke_dex/config/consts/images_size.dart';
import 'package:poke_dex/injector/main.dart';
import 'package:poke_dex/stores/pokemon/pokemon_store.dart';

import '../../../config/consts/urls.dart';
import '../../../utils/string_replace.dart';

class DetailsPageAnimatedImage extends StatefulWidget {
  final int index;
  final PokemonStore? pokemonStore;

  const DetailsPageAnimatedImage({
    Key? key,
    required this.index,
    this.pokemonStore,
  }) : super(key: key);

  @override
  State<DetailsPageAnimatedImage> createState() =>
      _DetailsPageAnimatedImageState();
}

class _DetailsPageAnimatedImageState extends State<DetailsPageAnimatedImage> {
  late PokemonStore _pokemonStore;

  @override
  void initState() {
    _pokemonStore = widget.pokemonStore ?? serviceLocator<PokemonStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _pokemon = _pokemonStore.getPokemon(index: widget.index);

    return Stack(
      children: [
        Opacity(
          opacity: 0.4,
          child: Image.asset(
            Images.whitePokeball,
            height: ImagesSize.large,
            width: ImagesSize.large,
          ),
        ),
        IgnorePointer(
          child: Observer(
            name: 'Pokemon',
            builder: (context) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedPadding(
                  padding: EdgeInsets.only(
                      top: widget.index == _pokemonStore.currentPosition
                          ? 0
                          : 60,
                      bottom: widget.index == _pokemonStore.currentPosition
                          ? 0
                          : 60),
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeIn,
                  child: Hero(
                    tag: widget.index == _pokemonStore.currentPosition
                        ? _pokemon.name!
                        : 'node ${widget.index}',
                    child: Image.network(
                      replaceVariables(text: Urls.pokemonImageUrl, variables: {
                        Urls.pokemonImageReplaceNumberParameter: _pokemon.num!
                      }),
                      height: ImagesSize.medium,
                      width: ImagesSize.medium,
                      color: widget.index == _pokemonStore.currentPosition
                          ? null
                          : Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
