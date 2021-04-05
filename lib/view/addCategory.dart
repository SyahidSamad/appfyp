import 'package:appfyp/styles/globalColor.dart';
import 'package:appfyp/styles/globalStyles.dart';
import 'package:appfyp/view/cameraScreen.dart';
import 'package:appfyp/widget/confirmButton.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddCategoryScreen extends StatefulWidget {
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  CameraDescription cameraDescription;

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
                  'Add Category.',
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
            '1. Category',
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
              hintText: 'eg : Animal, Park',
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
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.camera,
                            size: 14,
                            color: textColor,
                          ),
                          onPressed: () async {
                            final cameras = await availableCameras();

                            // Get a specific camera from the list of available cameras.
                            cameraDescription = cameras.first;
                            // TakePictureScreen(camera: cameraDescription);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TakePictureScreen(
                                      camera: cameraDescription)),
                            );
                          })
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
