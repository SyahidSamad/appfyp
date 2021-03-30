import 'package:appfyp/styles/globalColor.dart';
import 'package:appfyp/styles/globalStyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BMSButton extends StatelessWidget {
  final IconData fontFA;
  final String label;
  final Color color;
  final bool isOutline;
  final Function onPressed;

  const BMSButton(
      {this.fontFA,
      this.label,
      this.color,
      this.isOutline,
      @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: textColor,
        backgroundColor: isOutline ? null : confirmButtonColor,
        //onSurface: Colors.green,
        side: BorderSide(
            color: isOutline ? alertColor : confirmButtonColor, width: 0),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          FaIcon(
            fontFA,
            size: 14,
            color: color,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: getFont(14, FontWeight.w500, color),
          )
        ],
      ),
    );
  }
}
