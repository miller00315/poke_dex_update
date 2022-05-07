import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poke_dex/injector/main.dart';
import 'package:poke_dex/stores/pokemon/pokemon_store.dart';

class DetailsPageAppBar extends StatelessWidget {
  final double opacityTitleAppBar;
  final _pokemonStore = serviceLocator<PokemonStore>();

  DetailsPageAppBar({
    Key? key,
    required this.opacityTitleAppBar,
  }) : super(key: key);

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
          child: Container(
            color: Colors.white,
            height: 50,
            width: 50,
          ),
          opacity: opacityTitleAppBar >= 0.2 ? 0.2 : 0.0,
        ),
        Observer(
          builder: (BuildContext context) => IconButton(
            icon: _pokemonStore.favorites
                    .contains(_pokemonStore.currentPokemon!.id)
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
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
