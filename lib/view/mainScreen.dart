import 'package:appfyp/styles/globalColor.dart';
import 'package:appfyp/styles/globalStyles.dart';
import 'package:appfyp/widget/categoryList.dart';
import 'package:appfyp/widget/categoryPage.dart';
import 'package:appfyp/widget/createSentence.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool createSentence = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "IZ TALK",
            style: getFont(24, FontWeight.bold),
          ),
        ),
        body: Stack(children: [
          Column(
            children: [
              CategoryList(),
              Expanded(child: CategoryPage()),
              createSentence ? CreateSentence() : Container(),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ]),
        floatingActionButton: createSentence
            ? FloatingActionButton(
                onPressed: () {
                  setState(() {
                    createSentence = false;
                  });
                },
                child: FaIcon(
                  FontAwesomeIcons.times,
                  color: Colors.white,
                ),
              )
            : ElevatedButton(
                onPressed: () {
                  setState(() {
                    createSentence = true;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Create\nSentences',
                    style: getFont(14, FontWeight.bold, Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ));
  }
}
