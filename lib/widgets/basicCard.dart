import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/themes/appTheme.dart';

class BasicCard extends StatelessWidget {
  BasicCard({this.title, this.children});
  final title;
  final children;

  getSubCard() {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
            margin: EdgeInsets.fromLTRB(0, AppTheme.defaultPaddingMediumDouble,0,0),
            shape: AppTheme.basicCardBorderStyle,
            elevation: 0,
          ),
        )
      ],
    );
  }

  Widget getRowWrapper(childern) {
    return Padding(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: childern,
        ),
        padding: AppTheme.defaultPaddingMedium);
  }

  @override
  Widget build(BuildContext context) {
    return Padding (
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.title,
                style: AppTheme.basicCardHeadingStyle,
              ),
              this.getSubCard()
            ]
        ),
        padding: AppTheme.defaultPaddingMedium,
      );
  }

}
