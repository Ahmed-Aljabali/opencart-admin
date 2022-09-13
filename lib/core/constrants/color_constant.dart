import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray400 = fromHex('#afafaf');

  static Color gray802 = fromHex('#505050');

  static Color black900 = fromHex('#000000');

  static Color gray800 = fromHex('#484848');

  static Color black901 = fromHex('#070707');

  static Color bluegray100 = fromHex('#cfcfcf');

  static Color gray200 = fromHex('#e8e8e8');

  static Color whiteA700E0 = fromHex('#e0fefefe');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray201 = fromHex('#eeeeee');

  static Color gray300 = fromHex('#dddddd');

  static Color gray50 = fromHex('#f8f8f8');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
