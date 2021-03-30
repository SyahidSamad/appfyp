import 'package:appfyp/styles/globalColor.dart';
import 'package:appfyp/styles/globalStyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateSentence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10 + 1,
                itemBuilder: (context, int) =>
                    int == 0 ? Container(width: 50) : wordContainer()),
            addButton(context),
          ],
        ));
  }

  Widget addButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 20,
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.horizontal(
              right: Radius.circular(10), left: Radius.circular(0)),
        ),
        child: IconButton(
          icon: Icon(FontAwesomeIcons.plus),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget wordContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: getDeco(Colors.white),
        // height: 50,
        width: 100,
      ),
    );
  }
}
