import 'dart:io';
import 'dart:ui';

import 'package:appfyp/enum.dart';
import 'package:appfyp/model/categorymodel.dart';
import 'package:appfyp/presenter/categoryPresenter.dart';
import 'package:appfyp/provider/rootProvider.dart';
import 'package:appfyp/styles/globalColor.dart';
import 'package:appfyp/styles/globalStyles.dart';
import 'package:appfyp/view/addCategory.dart';
import 'package:appfyp/view/baseView.dart';
import 'package:appfyp/widget/categoryPage.dart';
import 'package:appfyp/widget/dragabbleBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatefulWidget {
  final bool isSelected;

  const CategoryList([this.isSelected = false]);
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    var changeNotifier = context.watch<RootProvider>();
    return Column(
      children: [
        Container(
            height: 200,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                BaseView<CategoryPresenter>(
                  builder: (context, presenter, child) =>
                      presenter.theViewState == ViewState.BUSY
                          ? CircularProgressIndicator()
                          : presenter.categories.isEmpty
                              ? Center(
                                  child: Text(
                                    'Create your category now',
                                    style: getFont(14, FontWeight.bold),
                                  ),
                                )
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: presenter.categories.length,
                                  itemBuilder: (context, i) => circleItem(
                                          i, context, presenter.categories[i],
                                          onTap: () {
                                        changeNotifier.setCurrentIndex(i);
                                        setState(() {
                                          index = changeNotifier.getIndex;
                                        });
                                        print(
                                            'tap index ${changeNotifier.getIndex}');
                                      })),
                  onPresenterReady: (presenter) {
                    presenter.getCategory();
                  },
                ),
                addButton(context),
              ],
            )),
        Expanded(child: CategoryPage(index: index)),
      ],
    );
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCategoryScreen()),
            );
          },
        ),
      ),
    );
  }

  Widget circleItem(int itemIndex, BuildContext context, CategoryModel category,
      {Function() onTap}) {
    return Container(
      margin: EdgeInsets.only(left: itemIndex == 0 ? 50 : 0),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: ClipOval(
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
                  onTap: onTap,
                  splashColor: splashColor,
                  child: Ink(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(category.categoryPathToPicture)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            category.categoryName,
            style: getFont(14, FontWeight.w500),
          ),
          widget.isSelected
              ? Container(
                  height: 5,
                  width: 100,
                  decoration: BoxDecoration(color: textColor),
                )
              : Container()
        ],
      ),
    );
  }
}
