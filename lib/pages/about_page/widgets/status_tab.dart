import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poke_dex/config/consts/font_sizes.dart';
import 'package:poke_dex/injector/main.dart';
import 'package:poke_dex/models/pokemon_detail_model.dart';
import 'package:poke_dex/stores/pokemon/pokemon_v2_store.dart';

class StatusTab extends StatelessWidget {
  final PokemonV2Store _pokemonV2Store = serviceLocator<PokemonV2Store>();

  StatusTab({Key? key}) : super(key: key);

  List<int?> getStatusPokemon(PokemonDetailModel? pokeApiV2) {
    List<int?> list = [1, 2, 3, 4, 5, 6, 7];
    int sum = 0;
    if (pokeApiV2?.stats != null) {
      for (var statistic in pokeApiV2!.stats!) {
        sum = sum + statistic.baseStat!;
        switch (statistic.stat!.name) {
          case 'speed':
            list[0] = statistic.baseStat;
            break;
          case 'special-defense':
            list[1] = statistic.baseStat;
            break;
          case 'special-attack':
            list[2] = statistic.baseStat;
            break;
          case 'defense':
            list[3] = statistic.baseStat;
            break;
          case 'attack':
            list[4] = statistic.baseStat;
            break;
          case 'hp':
            list[5] = statistic.baseStat;
            break;
        }
      }
    }
    list[6] = sum;

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Observer(builder: (context) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Velocidade',
                    style: TextStyle(fontSize: FontSizes.medium, color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sp. Def',
                    style: TextStyle(fontSize: FontSizes.medium, color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sp. Atq',
                    style: TextStyle(fontSize: FontSizes.medium, color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Defesa',
                    style: TextStyle(fontSize: FontSizes.medium, color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Ataque',
                    style: TextStyle(fontSize: FontSizes.medium, color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'HP',
                    style: TextStyle(fontSize: FontSizes.medium, color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Total',
                    style: TextStyle(fontSize: FontSizes.medium, color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Observer(builder: (context) {
                List<int?> _list =
                    getStatusPokemon(_pokemonV2Store.pokemonDetail);
                return Column(
                  children: <Widget>[
                    Text(
                      _list[0].toString(),
                      style: const TextStyle(
                          fontSize: FontSizes.medium, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      _list[1].toString(),
                      style: const TextStyle(
                          fontSize: FontSizes.medium, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      _list[2].toString(),
                      style: const TextStyle(
                          fontSize: FontSizes.medium, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      _list[3].toString(),
                      style:
                          TextStyle(fontSize: FontSizes.medium, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      _list[4].toString(),
                      style: const TextStyle(
                          fontSize: FontSizes.medium, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      _list[5].toString(),
                      style: const TextStyle(
                          fontSize: FontSizes.medium, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      _list[6].toString(),
                      style: const TextStyle(
                          fontSize: FontSizes.medium, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              }),
              const SizedBox(
                width: 10,
              ),
              Observer(builder: (context) {
                List<int?> _list =
                    getStatusPokemon(_pokemonV2Store.pokemonDetail);
                return Column(
                  children: <Widget>[
                    StatusBar(
                      widthFactor: _list[0]! / 160,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    StatusBar(
                      widthFactor: _list[1]! / 160,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    StatusBar(
                      widthFactor: _list[2]! / 160,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    StatusBar(
                      widthFactor: _list[3]! / 160,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    StatusBar(
                      widthFactor: _list[4]! / 160,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    StatusBar(
                      widthFactor: _list[5]! / 160,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    StatusBar(
                      widthFactor: _list[6]! / 600,
                    ),
                  ],
                );
              }),
            ],
          ),
        );
      }),
    );
  }
}

class StatusBar extends StatelessWidget {
  final double? widthFactor;

  const StatusBar({Key? key, this.widthFactor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 19,
      child: Center(
        child: Container(
          height: 4,
          width: MediaQuery.of(context).size.width * .47,
          alignment: Alignment.centerLeft,
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            color: Colors.grey,
          ),
          child: FractionallySizedBox(
            widthFactor: widthFactor,
            heightFactor: 1.0,
            child: Container(
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: widthFactor! > 0.5 ? Colors.teal : Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
