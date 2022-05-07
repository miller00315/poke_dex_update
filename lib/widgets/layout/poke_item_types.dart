import 'package:flutter/material.dart';

class PokeItemTypes extends StatelessWidget {
  final List<String>? types;
  final double? fontSize;
  final double? height;
  final double? width;

  const PokeItemTypes({
    Key? key,
    required this.types,
    this.fontSize,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final typeList = types!
        .map(
          (type) => Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(80, 255, 255, 255)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    type.trim(),
                    style: TextStyle(
                      //fontFamily: 'Google',
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
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
