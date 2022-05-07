import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  final Widget child;

  const CustomBottomSheet({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet>
    with TickerProviderStateMixin {
  Widget _child = Container(
    height: 0,
  );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        _child = widget.child;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      curve: Curves.easeOutExpo,
      duration: const Duration(milliseconds: 300),
      child: _child,
    );
  }
}
