import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const defaultPaddingLargeDouble = 32.0;
  static const defaultPaddingMediumDouble = 16.0;
  static const defaultPaddingSmallDouble = 8.0;
  static const defaultBorderRadiusSmall = 8.0;
  static const defaultActionButtonSize = 28.0;
  static const defaultPaddingLarge = EdgeInsets.all(defaultPaddingLargeDouble);
  static const defaultPaddingMedium = EdgeInsets.all(defaultPaddingMediumDouble);
  static const defaultPaddingSmall = EdgeInsets.all(defaultPaddingSmallDouble);
  static const defaultPaddingNone = EdgeInsets.all(0);
  static const defaultPaddingMediumTop = EdgeInsets.fromLTRB(0,defaultPaddingMediumDouble,0,0);
  static const defaultPaddingLargeTop = EdgeInsets.fromLTRB(0,defaultPaddingLargeDouble,0,0);
  static const fontSizeLarge = 22.0;
  static const COLOR_GREY = Color.fromRGBO(217, 228, 240, 1);
  static const COLOR_DARK_GREY = Color.fromRGBO(72, 72, 72, 1);
  static const COLOR_ORANGE = Colors.orange;

  static const basicCardHeadingStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: fontSizeLarge);

  static var basicCardBorderStyle = RoundedRectangleBorder(
    side: BorderSide(
      color: COLOR_GREY,
      width: 1,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.circular(defaultBorderRadiusSmall),
  );

  static const defaultDivider = Divider(
    height: 1,
    thickness: 1,
    color: COLOR_GREY,
  );

  static basicCardInputBorderStyle(label) {
    return InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 14
        ),
        focusColor: COLOR_ORANGE,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: COLOR_ORANGE, width: 1, style: BorderStyle.solid),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.transparent, width: 1, style: BorderStyle.none),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: COLOR_ORANGE),
        ));
  }

  static getActionIconWrapper(icon){
    return Container(
      child: Padding(
        child: icon,
        padding: defaultPaddingSmall,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.5),
        borderRadius: BorderRadius.circular(defaultBorderRadiusSmall)
      ),
    );
  }
}
