import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poke_dex/config/consts/font_sizes.dart';
import 'package:poke_dex/injector/main.dart';
import 'package:poke_dex/models/pokemon_model.dart';
import 'package:poke_dex/stores/pokemon/pokemon_store.dart';

class EvolutionTab extends StatefulWidget {
  final PokemonStore? pokemonStore;

  const EvolutionTab({
    Key? key,
    this.pokemonStore,
  }) : super(key: key);

  @override
  State<EvolutionTab> createState() => _EvolutionTabState();
}

class _EvolutionTabState extends State<EvolutionTab> {
  late PokemonStore _pokemonStore;

  @override
  void initState() {
    _pokemonStore = widget.pokemonStore ?? serviceLocator<PokemonStore>();

    super.initState();
  }

  Widget resizePokemon(Widget widget) {
    return SizedBox(height: 80, width: 80, child: widget);
  }

  List<Widget> getEvolution(PokemonModel pokemon) {
    List<Widget> _list = [];
    if (pokemon.prevEvolution != null) {
      for (final pokemonEvolution in pokemon.prevEvolution!) {
        _list.add(
          resizePokemon(
            _pokemonStore.getImage(number: pokemonEvolution.number!),
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
        _pokemonStore.getImage(number: _pokemonStore.currentPokemon!.num!),
      ),
    );
    _list.add(
      Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Text(
          _pokemonStore.currentPokemon!.name!,
          style: const TextStyle(
            fontSize: FontSizes.medium,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    if (pokemon.nextEvolution != null) {
      _list.add(const Icon(Icons.keyboard_arrow_down));
      for (final f in pokemon.nextEvolution!) {
        _list.add(
          resizePokemon(
            _pokemonStore.getImage(
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
          PokemonModel pokemon = _pokemonStore.currentPokemon!;
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
