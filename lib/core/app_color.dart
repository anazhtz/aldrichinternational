import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor; // Add opacity value if not provided
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class AppColors {
  static final Color primaryColor = HexColor('#0F172A');
  static final Color secondaryColor = HexColor('#1E293B');
  static final Color textFeildColor = HexColor('#0F172A');
  static final Color success = HexColor('#15995e');
  static final Color warning = HexColor('#d09e12');
  static final Color danger = HexColor('#de3e3e');
  static final Color accentColor = HexColor('#e74c3c');
  static final Color backgroundColor = HexColor('#ecf0f1');
  static final Color textColor = HexColor('#2c3e50');
  static final Color buttonColor = HexColor('#4F46E5');
  static final Color tournButtonColor = HexColor("#F1902F");
  static final Color appBar = HexColor("#DEF7F0");
  static final Color menubackgroundColor = HexColor("#F0F3F5");
  static final Color cancelButton = HexColor("#FF1E1E");
  static final Color submitButton = HexColor("#23AD00");
}