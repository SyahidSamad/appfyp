import 'dart:ui';

import 'package:appfyp/styles/globalColor.dart';
import 'package:appfyp/styles/globalStyles.dart';
import 'package:appfyp/view/addCategory.dart';
import 'package:appfyp/view/addItemScreen.dart';
import 'package:appfyp/widget/dragabbleBottomSheet.dart';
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
                    int == 0 ? Container(width: 50) : circleItem(context)),
            addButton(context),
          ],
        ));
  }

  Widget addButton(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.horizontal(
            right: Radius.circular(10), left: Radius.circular(0)),
      ),
      child: IconButton(
        icon: Icon(FontAwesomeIcons.plus),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCategoryScreen()),
          );
        },
      ),
    );
  }

  Widget circleItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Material(
              //color: Colors.blue, // button color
              child: InkWell(
                onLongPress: () {
                  print('long tap');
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => ChooseTimeDialog(),
                  );
                  // showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return Dialog(
                  //           child: Container(
                  //               width: 310,
                  //               height: 168,
                  //               color: Colors.white,
                  //               child: Text(
                  //                 'Your Action',
                  //                 style: TextStyle(
                  //                     fontFamily: 'Poppins',
                  //                     color: Colors.black,
                  //                     fontWeight: FontWeight.w500,
                  //                     fontSize: 18),
                  //               )));
                  //     });
                },
                onTap: () {
                  print('tap');
                },
                splashColor: splashColor,
                child: Ink(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/gambartry.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
}
