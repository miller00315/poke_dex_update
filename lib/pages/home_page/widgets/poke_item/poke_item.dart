import 'package:flutter/material.dart';
import 'package:poke_dex/config/consts/palette.dart';
import 'package:poke_dex/config/consts/urls.dart';
import 'package:poke_dex/models/pokemon_model.dart';
import 'package:poke_dex/widgets/layout/poke_item_types.dart';
import 'package:poke_dex/utils/string_replace.dart';

class PokeItem extends StatelessWidget {
  /* final String? name;
  
  final Color? color;
  final String? num;
  final List<String>? types; */
  final PokemonModel pokemon;

  /// Index of pokemon in the list
  final int? index;

  const PokeItem({
    Key? key,
    required this.pokemon,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: Hero(
                  child: Container(),
                  /* child: Opacity(
                    child: Image.asset(
                      ConstsApp.whitePokeball,
                      height: 80,
                      width: 80,
                    ),
                    opacity: 0.2,
                  ), */
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
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PokeItemTypes(
                      types: pokemon.type,
                      height: 8,
                      fontSize: 12,
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
                      text: Urls.POKEMON_IMAGE_URL,
                      variables: {
                        Urls.POKEMON_IMAGE_NUMBER: pokemon.num!,
                      },
                    ),
                    alignment: Alignment.bottomRight,
                    height: 80,
                    width: 80,
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
              Palette.getColorType(type: pokemon.type![0])!.withOpacity(0.7),
              Palette.getColorType(type: pokemon.type![0])!
            ],
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}