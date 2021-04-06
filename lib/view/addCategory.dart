import 'package:appfyp/model/categorymodel.dart';
import 'package:appfyp/model/itemmodel.dart';
import 'package:appfyp/presenter/categoryPresenter.dart';
import 'package:appfyp/provider/rootProvider.dart';
import 'package:appfyp/styles/globalColor.dart';
import 'package:appfyp/styles/globalStyles.dart';
import 'package:appfyp/view/baseView.dart';
import 'package:appfyp/view/cameraScreen.dart';
import 'package:appfyp/view/mainScreen.dart';
import 'package:appfyp/widget/confirmButton.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class AddCategoryScreen extends StatefulWidget {
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final TextEditingController categoryNameController = TextEditingController();
  CameraDescription cameraDescription;
  final _formKey = GlobalKey<FormState>();
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
  List<ItemModel> listOfItemModel;
  Map data = {
    'categoryName': null,
    'categoryPathToPicture': null,
    'listOfItem': null
  };
  bool imageNull = false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageToListen = Provider.of<RootProvider>(context);
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
                    //*TODO: Add dialog before pop the screen
                    imageToListen.setCameraImagePath(null);
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
                Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: fieldContainer()),
                SizedBox(
                  height: 14,
                ),
                addFilesContainer(2, 'Image',
                    imageToListen: imageToListen.getCameraImagePath),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BaseView<CategoryPresenter>(
                        builder: (context, presenter, child) {
                      return ConfirmButton(
                        onTap: () async {
                          data['categoryName'] = categoryNameController.text;
                          data['categoryPathToPicture'] =
                              imageToListen.getCameraImagePath;
                          data['listOfItem'] = listOfItemModel;
                          if (imageToListen.getCameraImagePath == null) {
                            setState(() {
                              imageNull = true;
                            });
                          }

                          if (_formKey.currentState.validate() &&
                              imageToListen.getCameraImagePath != null) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Processing Data'),
                              duration: Duration(seconds: 1),
                            ));
                            await presenter.createCategory(
                                data: CategoryModel(data).toMap());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen()),
                            );
                          }
                          print('$data');
                        },
                      );
                    })
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
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '* This field is mandatory';
              }
              return null;
            },
            controller: categoryNameController,
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

  Widget addFilesContainer(int number, String name, {String imageToListen}) {
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
            //height: 240,
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Center(
              child: imageToListen == null
                  ? Column(
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
                                  setState(() {
                                    imageNull = false;
                                  });
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
                          onPressed: () {
                            setState(() {
                              imageNull = false;
                            });
                          },
                          child: Text('Choose..'),
                        )
                      ],
                    )
                  : Image.file(File(imageToListen)),
            ),
          ),
          imageNull
              ? Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    '* This field is mandatory',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
