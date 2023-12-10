import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimensions.dart';

class CustomStyle {
  static var textStyle = TextStyle(color: CustomColor.greyColor, fontSize: Dimensions.defaultTextSize);

  static var hintTextStyle = TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: Dimensions.defaultTextSize);

  static var listStyle = TextStyle(
    color: Colors.black,
    fontSize: Dimensions.defaultTextSize,
  );

  static var defaultStyle = TextStyle(color: Colors.black, fontSize: Dimensions.largeTextSize);

  static var focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius * 3),
    borderSide: const BorderSide(color: Colors.white),
  );

  static var noBorderfocusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius * 3),
    borderSide: const BorderSide(color: Colors.white),
  );

  static var focusErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius * 3),
    borderSide: const BorderSide(color: Colors.white),
  );

  static var searchBox = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(color: Colors.black),
  );

  static var kTitleStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'CM Sans Serif',
    fontSize: 20.0,
    height: 1.5,
  );

  static var kSubtitleStyle = const TextStyle(
    color: CustomColor.primaryColor, //Colors.white,
    fontSize: 22.0,
    height: 1.3,
  );

  static var kSubtitleStyleBold = const TextStyle(
    color: CustomColor.primaryColor, //Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 22.0,
    height: 1.3,
  );
}
