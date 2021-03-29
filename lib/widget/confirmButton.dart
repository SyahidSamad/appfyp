import 'package:appfyp/styles/globalColor.dart';
import 'package:appfyp/styles/globalStyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConfirmButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: splashColor,
      onTap: () {},
      child: Ink(
        padding: EdgeInsets.all(4),
        height: 40,
        width: 120,
        decoration: getDeco(confirmButtonColor),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Confirm',
                style: getFont(14, FontWeight.w500, Colors.white),
              ),
              SizedBox(
                width: 10,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipOval(
                    child: Container(
                      height: 24,
                      width: 24,
                      color: clipOvalColor,
                    ),
                  ),
                  FaIcon(
                    FontAwesomeIcons.arrowRight,
                    size: 12,
                    color: Colors.white,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
