import 'dart:ui';

import 'package:flutter/services.dart';

///Altera a cor da barra de status
/// [statusBarColor] é a cor a ser utilizada,
/// [brightness] é a cor dos items da barra
void changeStatusBarColor({
  required Color statusBarColor,
  Brightness brightness = Brightness.dark,
}) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: brightness,
    statusBarColor: statusBarColor,
  ));
}
