import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poke_dex/config/consts/font_sizes.dart';
import 'package:poke_dex/models/pokemon_model.dart';
import 'package:poke_dex/stores/pokemon/pokemon_store.dart';

class EvolutionTab extends StatelessWidget {
  final PokemonStore? pokemonStore;

  const EvolutionTab({
    Key? key,
    required this.pokemonStore,
  }) : super(key: key);

  Widget resizePokemon(Widget widget) {
    return SizedBox(height: 80, width: 80, child: widget);
  }

  List<Widget> getEvolution(PokemonModel pokemon) {
    List<Widget> _list = [];
    if (pokemon.prevEvolution != null) {
      for (var pokemonEvolution in pokemon.prevEvolution!) {
        _list.add(
          resizePokemon(
            pokemonStore!.getImage(number: pokemonEvolution.number!),
          ),
        );
        _list.add(
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              pokemonEvolution.name!,
              style: const TextStyle(
                fontSize: FontSizes.medium,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        _list.add(const Icon(Icons.keyboard_arrow_down));
      }
    }
    _list.add(
      resizePokemon(
        pokemonStore!.getImage(number: pokemonStore!.currentPokemon!.num!),
      ),
    );
    _list.add(
      Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Text(
          pokemonStore!.currentPokemon!.name!,
          style: const TextStyle(
            fontSize: FontSizes.medium,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    if (pokemon.nextEvolution != null) {
      _list.add(const Icon(Icons.keyboard_arrow_down));
      for (var f in pokemon.nextEvolution!) {
        _list.add(
          resizePokemon(
            pokemonStore!.getImage(
              number: f.number!,
            ),
          ),
        );
        _list.add(
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              f.name!,
              style: const TextStyle(
                fontSize: FontSizes.medium,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        if (pokemon.nextEvolution!.last.name != f.name) {
          _list.add(const Icon(Icons.keyboard_arrow_down));
        }
      }
    }

    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Observer(
        builder: (context) {
          PokemonModel pokemon = pokemonStore!.currentPokemon!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: getEvolution(pokemon),
            ),
          );
        },
      ),
    );
  }
}
