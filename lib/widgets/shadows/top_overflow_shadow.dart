import 'package:align_positioned/align_positioned.dart';
import 'package:flutter/material.dart';

class TopOverflowShadow extends StatelessWidget {
  final Widget child;
  final double elevation;

  const TopOverflowShadow({
    required this.child,
    this.elevation = 6,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        AlignPositioned(
          moveByChildHeight: -0.3,
          moveByContainerHeight: -0.5,
          child: Container(
            height: 24,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 0,
                  blurRadius: elevation,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
