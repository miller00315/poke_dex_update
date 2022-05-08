import 'package:flutter/material.dart';
import 'package:poke_dex/config/consts/app_text.dart';
import 'package:poke_dex/config/consts/font_sizes.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 13, right: 5),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  AppText.pokedex,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSizes.ultraLarge,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
