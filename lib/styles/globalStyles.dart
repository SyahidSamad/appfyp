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

BoxDecoration getDeco(Color color,
    [BorderRadius radiusType = const BorderRadius.all(
      Radius.circular(4.0),
    ),
    Border border]) {
  return BoxDecoration(
    border: border == null ? null : border,
    borderRadius: radiusType,
    color: color,
  );
}
