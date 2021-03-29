import 'package:flutter/material.dart';

TextStyle getFont(double fontSize, FontWeight fontWeight, [Color colors]) {
  if (colors == null) {
    colors = Color(0xff393939);
  }
  return TextStyle(
      color: colors,
      fontSize: fontSize,
      fontFamily: 'Poppins',
      fontWeight: fontWeight);
}

BoxDecoration getDeco(Color color) {
  return BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(4.0),
    ),
    color: color,
  );
}
