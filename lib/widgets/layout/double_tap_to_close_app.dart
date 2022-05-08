import 'dart:async';

import 'package:flutter/material.dart';

class DoubleTapToCloseApp extends StatefulWidget {
  final SnackBar snackBar;

  final Widget child;

  const DoubleTapToCloseApp({
    Key? key,
    required this.snackBar,
    required this.child,
  }) : super(key: key);

  @override
  _DoubleTapToCloseAppState createState() => _DoubleTapToCloseAppState();
}

class _DoubleTapToCloseAppState extends State<DoubleTapToCloseApp> {
  DateTime? _lastTimeBackButtonWasTapped;

  bool get _isAndroid => Theme.of(context).platform == TargetPlatform.android;

  bool get _isSnackBarVisible =>
      (_lastTimeBackButtonWasTapped != null) &&
      (widget.snackBar.duration >
          DateTime.now().difference(_lastTimeBackButtonWasTapped!));

  bool get _willHandlePopInternally =>
      ModalRoute.of(context)!.willHandlePopInternally;

  @override
  Widget build(BuildContext context) {
    _ensureThatContextContainsScaffold();

    if (_isAndroid) {
      return WillPopScope(
        onWillPop: _handleWillPop,
        child: widget.child,
      );
    } else {
      return widget.child;
    }
  }

  Future<bool> _handleWillPop() async {
    if (_isSnackBarVisible || _willHandlePopInternally) {
      return true;
    } else {
      _lastTimeBackButtonWasTapped = DateTime.now();
      ScaffoldMessenger.of(context).showSnackBar(widget.snackBar);

      return false;
    }
  }

  void _ensureThatContextContainsScaffold() {
    if (Scaffold.of(context) == null) {
      throw FlutterError(
        '`DoubleTapToCloseApp` must be wrapped in a `Scaffold`.',
      );
    }
  }
}
