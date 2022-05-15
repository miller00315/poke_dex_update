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

/// Widget para apresentação do tipo de pokemon
/// Se [shouldTranslate] for true os textos referentes à [pokemon.type] serão traduzidos do en para pt
class PokeItem extends StatelessWidget {
  /// O pokemon a ser apresentado
  final PokemonModel pokemon;

  /// store utilizada em testes
  final PokemonStore? pokemonStore;

  /// posição na lista referente ao pokemon atual
  final int index;

  /// define se os textos serão traduzidos ou não
  final bool shouldTranslate;

  PokeItem({
    Key? key,
    required this.pokemon,
    required this.index,
    this.pokemonStore,
    this.shouldTranslate = true,
  }) : super(key: key);

  final PokemonStore _pokemonStore = serviceLocator<PokemonStore>();

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
                      tag: pokemon.name! + 'roatation',
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                        child: Text(
                          pokemon.name!,
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
                          shouldTranslate: shouldTranslate,
                          types: pokemon.type,
                          height: 8,
                          fontSize: FontSizes.ultraSmall,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Hero(
                      tag: pokemon.name!,
                      child: Image.network(
                        replaceVariables(
                          text: Urls.pokemonImageUrl,
                          variables: {
                            Urls.pokemonImageReplaceNumberParameter:
                                pokemon.num!,
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
                  Palette.getColorType(type: pokemon.type![0])!
                      .withOpacity(0.7),
                  Palette.getColorType(type: pokemon.type![0])!
                ],
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(AppBorderRadius.medium),
              ),
            ),
          ),
          Observer(
            builder: (BuildContext context) =>
                _pokemonStore.favorites.contains(pokemon.id)
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
