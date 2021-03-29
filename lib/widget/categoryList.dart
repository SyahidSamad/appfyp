import 'package:appfyp/styles/globalColor.dart';
import 'package:appfyp/styles/globalStyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10 + 1,
                itemBuilder: (context, int) =>
                    int == 0 ? Container(width: 50) : circleItem()),
            addButton(),
          ],
        ));
  }
}

Widget addButton() {
  return Container(
    height: 50,
    decoration: BoxDecoration(
      color: buttonColor,
      borderRadius: BorderRadius.horizontal(
          right: Radius.circular(10), left: Radius.circular(0)),
    ),
    child: IconButton(
      icon: Icon(FontAwesomeIcons.plus),
      onPressed: () {},
    ),
  );
}

Widget circleItem() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: Material(
            color: Colors.blue, // button color
            child: InkWell(
              onLongPress: () {
                print('long tap');
              },
              splashColor: Colors.red, // inkwell color
              child: SizedBox(width: 100, height: 100),
              onTap: () {
                print('tap');
              },
            ),
          ),
        ),
        Text(
          'Animals',
          style: getFont(14, FontWeight.w500),
        )
      ],
    ),
  );
}
