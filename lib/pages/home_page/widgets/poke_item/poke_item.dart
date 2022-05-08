import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poke_dex/config/consts/app_border_radius.dart';
import 'package:poke_dex/config/consts/font_sizes.dart';
import 'package:poke_dex/config/consts/images.dart';
import 'package:poke_dex/config/consts/images_size.dart';
import 'package:poke_dex/config/consts/palette.dart';
import 'package:poke_dex/config/consts/urls.dart';
import 'package:poke_dex/injector/main.dart';
import 'package:poke_dex/models/pokemon_model.dart';
import 'package:poke_dex/stores/pokemon/pokemon_store.dart';
import 'package:poke_dex/widgets/layout/poke_item_types.dart';
import 'package:poke_dex/utils/string_replace.dart';

class PokeItem extends StatefulWidget {
  final PokemonModel pokemon;
  final PokemonStore? pokemonStore;
  final int index;

  const PokeItem({
    Key? key,
    required this.pokemon,
    required this.index,
    this.pokemonStore,
  }) : super(key: key);

  @override
  State<PokeItem> createState() => _PokeItemState();
}

class _PokeItemState extends State<PokeItem> {
  late PokemonStore _pokemonStore;

  @override
  void initState() {
    _pokemonStore = widget.pokemonStore ?? serviceLocator<PokemonStore>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Hero(
                      child: Opacity(
                        child: Image.asset(
                          Images.whitePokeball,
                          height: ImagesSize.extraSmall,
                          width: ImagesSize.extraSmall,
                        ),
                        opacity: 0.5,
                      ),
                      tag: widget.pokemon.name! + 'roatation',
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                        child: Text(
                          widget.pokemon.name!,
                          style: const TextStyle(
                            fontSize: FontSizes.medium,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PokeItemTypes(
                          types: widget.pokemon.type,
                          height: 8,
                          fontSize: FontSizes.ultraSmall,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Hero(
                      tag: widget.pokemon.name!,
                      child: Image.network(
                        replaceVariables(
                          text: Urls.pokemonImageUrl,
                          variables: {
                            Urls.pokemonImageReplaceNumberParameter:
                                widget.pokemon.num!,
                          },
                        ),
                        alignment: Alignment.bottomRight,
                        height: ImagesSize.extraSmall,
                        width: ImagesSize.extraSmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Palette.getColorType(type: widget.pokemon.type![0])!
                      .withOpacity(0.7),
                  Palette.getColorType(type: widget.pokemon.type![0])!
                ],
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(AppBorderRadius.medium),
              ),
            ),
          ),
          Observer(
            builder: (BuildContext context) =>
                _pokemonStore.favorites.contains(widget.pokemon.id)
                    ? const Positioned(
                        top: -(ImagesSize.ultraSmall / 4),
                        right: -(ImagesSize.ultraSmall / 2),
                        child: Icon(
                          Icons.favorite,
                          size: ImagesSize.ultraSmall,
                          color: Palette.favoriteColor,
                        ),
                      )
                    : Container(),
          ),
        ],
      ),
    );
  }
}
