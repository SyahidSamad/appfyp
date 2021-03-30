import 'package:appfyp/styles/globalColor.dart';
import 'package:appfyp/styles/globalStyles.dart';
import 'package:appfyp/view/addItemScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        children: [
          categoryName(context),
          Expanded(child: listOfItem()),
          SizedBox(height: 14)
        ],
      ),
    );
  }

  Widget categoryName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Animals',
          style: getFont(24, FontWeight.bold),
        ),
        addItemButton(context),
      ],
    );
  }

  Widget addItemButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddItemScreen()),
        );
      },
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
      thickness: 8,
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
    return Card(
      elevation: 2,
      child: SizedBox(
        //height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: () {},
                splashColor: splashColor,
                child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0)),
                      image: DecorationImage(
                        image: AssetImage("assets/images/gambartry.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [_simplePopup()],
                        )
                      ],
                    )),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: bottomCardItemColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4.0),
                        bottomRight: Radius.circular(4.0))),
                child: Center(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          child: Icon(
                            FontAwesomeIcons.music,
                            color: textColor,
                            size: 14,
                          ),
                          onTap: () {}),
                      Text(
                        "Bottom",
                        style: getFont(14, FontWeight.w500),
                      ),
                      InkWell(
                          child: Icon(
                            FontAwesomeIcons.play,
                            size: 14,
                            color: textColor,
                          ),
                          onTap: () {}),
                    ],
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _simplePopup() => PopupMenuButton<int>(
        //padding: EdgeInsets.only(left: 14),
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.edit,
                  size: 14,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Edit",
                  style: getFont(14, FontWeight.w500),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.trash,
                  size: 14,
                  color: alertColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Delete",
                  style: getFont(14, FontWeight.w500, alertColor),
                ),
              ],
            ),
          ),
        ],
      );
}
