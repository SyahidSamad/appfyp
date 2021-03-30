import 'package:appfyp/styles/globalColor.dart';
import 'package:appfyp/styles/globalStyles.dart';
import 'package:flutter/material.dart';

class IndicatorBMS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 120,
      decoration:
          getDeco(bottomCardItemColor, BorderRadius.all(Radius.circular(8.0))),
    );
  }
}
