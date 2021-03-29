import 'package:appfyp/styles/globalColor.dart';
import 'package:appfyp/styles/globalStyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        children: [
          categoryName(),
          Expanded(child: listOfItem()),
          SizedBox(height: 14)
        ],
      ),
    );
  }

  Widget categoryName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Animals',
          style: getFont(24, FontWeight.bold),
        ),
        addItemButton(),
      ],
    );
  }

  Widget addItemButton() {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color: textColor,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        height: 30,
        width: 30,
        child: Icon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget listOfItem() {
    return Scrollbar(
      child: GridView.builder(
          padding: EdgeInsets.only(bottom: 400),
          //shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: 12,
          itemBuilder: (context, int) => itemCard()),
    );
  }

  Widget itemCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        child: Text('Name'),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
