import 'dart:ui';

import 'package:flutter/services.dart';

void changeStatusBarColor({
  required Color statusBarColor,
  Brightness brightness = Brightness.dark,
}) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: brightness,
    statusBarColor: statusBarColor,
  ));
}
