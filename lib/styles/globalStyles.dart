import 'package:flutter/material.dart';

TextStyle getFont(double fontSize, FontWeight fontWeight, [Color colors]) {
  colors = Color(0xff393939);
  return TextStyle(
      color: colors,
      fontSize: fontSize,
      fontFamily: 'Poppins',
      fontWeight: fontWeight);
}
