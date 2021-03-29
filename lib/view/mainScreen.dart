import 'package:appfyp/styles/globalColor.dart';
import 'package:appfyp/styles/globalStyles.dart';
import 'package:appfyp/widget/categoryList.dart';
import 'package:appfyp/widget/categoryPage.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
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
        body: Column(
          children: [
            CategoryList(),
            Expanded(child: CategoryPage()),
          ],
        ));
  }
}
