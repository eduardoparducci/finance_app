import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFF7b1fa2);
Color primaryDark = const Color(0xFF4a0072);
Color primaryLight = const Color(0xFFae52d4);
Color primaryAccent = const Color(0xFFf9a825);

class Styles {
  // Main Colorset
  static Color primary = primaryColor;
  static Color dark = primaryDark;
  static Color light = primaryLight;
  static Color accent = primaryAccent;
  static Color background = const Color(0xfff0f0f0);

  // Status Colorset
  static Color success = const Color(0xff2e7d32);
  static Color warning = const Color(0xfffbc02d);
  static Color error = const Color(0xffb71c1c);
  static Color disabled = Colors.blueGrey;

  // Text Colors

  static TextStyle title1 = const TextStyle(fontSize: 26, color: Colors.black87, fontWeight: FontWeight.bold);
  static TextStyle title2 = const TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold);
  static TextStyle title3 = const TextStyle(fontSize: 12, color: Colors.black87, fontWeight: FontWeight.bold);
  static TextStyle title4 = const TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.w600);
  static TextStyle subtitle1 = const TextStyle(fontSize: 16, color: Colors.black26, fontWeight: FontWeight.w600);
  static TextStyle subtitle2 = const TextStyle(fontSize: 14, color: Colors.black26, fontWeight: FontWeight.w600);
}