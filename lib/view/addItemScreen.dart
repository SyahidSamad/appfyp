import 'package:appfyp/styles/globalColor.dart';
import 'package:appfyp/styles/globalStyles.dart';
import 'package:appfyp/widget/confirmButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddItemScreen extends StatelessWidget {
  final Map<String, Widget> iconInContainer = {
    "Image": FaIcon(
      FontAwesomeIcons.image,
      size: 14,
      color: textColor,
    ),
    "Sound": FaIcon(
      FontAwesomeIcons.music,
      size: 14,
      color: textColor,
    ),
    "Video(Optional)": FaIcon(
      FontAwesomeIcons.video,
      size: 14,
      color: textColor,
    )
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: textColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  'Add Item.',
                  style: getFont(24, FontWeight.bold),
                ),
                SizedBox(
                  height: 14,
                ),
                fieldContainer(),
                SizedBox(
                  height: 14,
                ),
                addFilesContainer(2, 'Image'),
                SizedBox(
                  height: 14,
                ),
                addFilesContainer(3, 'Sound'),
                SizedBox(
                  height: 14,
                ),
                addFilesContainer(4, 'Video(Optional)'),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ConfirmButton(),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget fieldContainer() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '1. Item Name',
            style: getFont(14, FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                //borderSide: BorderSide.none,
                borderSide: BorderSide(color: textColor, width: 2.0),
                borderRadius: BorderRadius.circular(4),
              ),
              contentPadding: EdgeInsets.all(16),
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide.none,
              //   borderRadius: BorderRadius.circular(4),
              // ),
              fillColor: Colors.white,
              filled: true,
              hintText: 'eg : Lion, Shoes',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget addFilesContainer(int number, String name) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${number.toString()}. $name',
            style: getFont(14, FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: getDeco(Colors.white),
            height: 240,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      iconInContainer[name],
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Add $name',
                        style: getFont(14, FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Choose..'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
