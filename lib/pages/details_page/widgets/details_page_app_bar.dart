import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poke_dex/config/consts/images.dart';
import 'package:poke_dex/config/consts/palette.dart';
import 'package:poke_dex/injector/main.dart';
import 'package:poke_dex/stores/pokemon/pokemon_store.dart';

class DetailsPageAppBar extends StatelessWidget {
  final double opacityTitleAppBar;

  DetailsPageAppBar({
    Key? key,
    required this.opacityTitleAppBar,
  }) : super(key: key);

  final PokemonStore _pokemonStore = serviceLocator<PokemonStore>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            child: Image.asset(
              Images.whitePokeball,
              height: 50,
              width: 50,
            ),
            opacity: opacityTitleAppBar,
          ),
          opacity: opacityTitleAppBar,
        ),
        Observer(
          builder: (BuildContext context) => IconButton(
            icon: _pokemonStore.favorites
                    .contains(_pokemonStore.currentPokemon!.id)
                ? const Icon(
                    Icons.favorite,
                    color: Palette.favoriteColor,
                  )
                : const Icon(Icons.favorite_border),
            onPressed: () => _pokemonStore.favoriteUnfavorite(
              _pokemonStore.currentPokemon!.id!,
            ),
          ),
        ),
      ],
    );
  }
}
