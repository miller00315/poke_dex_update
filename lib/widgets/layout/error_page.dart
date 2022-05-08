import 'package:flutter/material.dart';
import 'package:poke_dex/config/consts/app_text.dart';
import 'package:poke_dex/config/consts/font_sizes.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        AppText.error,
        style: TextStyle(
          fontFamily: 'Google',
          fontSize: FontSizes.large,
        ),
      ),
    );
  }
}