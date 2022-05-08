import 'package:flutter/material.dart';
import 'package:poke_dex/config/consts/app_border_radius.dart';
import 'package:poke_dex/config/consts/app_text.dart';
import 'package:poke_dex/config/consts/palette.dart';
import 'package:translator/translator.dart';

class PokeItemTypes extends StatelessWidget {
  final List<String>? types;
  final double? fontSize;
  final double? height;
  final double? width;
  final bool shouldTranslate;

  final translator = GoogleTranslator();

  PokeItemTypes({
    Key? key,
    required this.types,
    this.fontSize,
    this.height,
    this.width,
    this.shouldTranslate = true,
  }) : super(key: key);

  Future<String> translatedText(String text) async {
    final translation = await translator.translate(text, to: 'pt');

    return translation.text;
  }

  Widget buildText(String text) => Text(
        text,
        style: TextStyle(
          fontFamily: 'Google',
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final typeList = types!
        .map(
          (type) => Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppBorderRadius.medium),
                  color: Palette.pokemonTypeBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: shouldTranslate
                      ? FutureBuilder(
                          future: translatedText(
                            type.trim(),
                          ),
                          builder: (context, snapshot) {
                            var text = AppText.translating;

                            if (snapshot.hasError) {
                              text = AppText.error;
                            }

                            if (snapshot.hasData) {
                              text = snapshot.data.toString();

                              if (text == AppText.error) {
                                text = AppText.insect;
                              }
                            }

                            return buildText(text);
                          },
                        )
                      : buildText(type.trim()),
                ),
              ),
              SizedBox(
                height: height,
                width: width,
              )
            ],
          ),
        )
        .toList();

    return Column(
      children: typeList,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
