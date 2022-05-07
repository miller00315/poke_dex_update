import 'package:flutter/material.dart';
import 'package:poke_dex/config/consts/font_sizes.dart';

import '../../../widgets/layout/poke_item_types.dart';

class DetailsPageHeader extends StatelessWidget {
  final List<String> types;
  final String number;

  const DetailsPageHeader({
    Key? key,
    required this.number,
    required this.types,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            PokeItemTypes(
              types: types,
              fontSize: FontSizes.small,
              width: 8,
              height: 8,
            ),
            Text(
              '# $number',
              style: const TextStyle(
                //fontFamily: 'Google',
                fontSize: FontSizes.ultraLarge,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
