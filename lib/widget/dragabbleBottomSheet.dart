import 'package:appfyp/styles/globalColor.dart';
import 'package:appfyp/styles/globalStyles.dart';
import 'package:appfyp/widget/bottomSheetButton.dart';
import 'package:appfyp/widget/indicatorBottomModalSheet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChooseTimeDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: getDeco(
              Colors.white,
              BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            children: [
              SizedBox(height: 8.0),
              IndicatorBMS(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Column(
                    children: [
                      BMSButton(
                        fontFA: FontAwesomeIcons.edit,
                        label: 'Edit',
                        color: textColor,
                        isOutline: false,
                        onPressed: () {
                          print('tap');
                        },
                      ),
                      BMSButton(
                        fontFA: FontAwesomeIcons.trash,
                        label: 'Delete',
                        color: alertColor,
                        isOutline: true,
                        onPressed: () {
                          print('tap');
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
