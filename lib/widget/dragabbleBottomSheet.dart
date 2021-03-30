import 'package:appfyp/styles/globalColor.dart';
import 'package:appfyp/styles/globalStyles.dart';
import 'package:appfyp/widget/indicatorBottomModalSheet.dart';
import 'package:flutter/material.dart';

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
              SizedBox(height: 8.0)
            ],
          ),
        );
      },
    );
  }
}
