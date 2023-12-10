/*
 * Created by 李卓原 on 2018/9/29.
 * email: zhuoyuan93@gmail.com
 */

import 'package:flutter/material.dart';

class ScreenUtil {
  static ScreenUtil _instance;

  /// Size of the phone in UI Design , px
  double width;
  double height;

  /// allowFontScaling Specifies whether fonts should scale to respect Text Size accessibility settings. The default is false.
  bool allowFontScaling;

  static MediaQueryData _mediaQueryData;
  static double _screenWidth;
  static double _screenHeight;
  static double _pixelRatio;
  static double _statusBarHeight;
  static double _bottomBarHeight;
  static double _textScaleFactor;
  static double _bodyHeight;
  static double _bodyHeightWithBottomNavigation;

  ScreenUtil._({this.width = 1440, this.height = 2560, this.allowFontScaling = false});

  factory ScreenUtil() {
    if (_instance == null) {
      throw Exception("Screen Util is not initialized.");
    }
    return _instance;
  }

  static ScreenUtil get getInstance {
    return _instance;
  }

  static void init(BuildContext context, {double width = 410, double height = 683, bool allowFontScaling = false}) {
    _instance = ScreenUtil._(width: width, height: height, allowFontScaling: allowFontScaling);
    MediaQueryData mediaQuery = MediaQuery.of(context);

    _mediaQueryData = mediaQuery;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = _mediaQueryData.padding.bottom;
    _textScaleFactor = mediaQuery.textScaleFactor;
    var appbarHeight = _instance.setHeight(50);
    var scaffoldPadding = _instance.setWidth(8);
    _bodyHeight = _screenHeight - _statusBarHeight - appbarHeight - scaffoldPadding;
    _bodyHeightWithBottomNavigation =
        _screenHeight - _statusBarHeight - appbarHeight - appbarHeight - _bottomBarHeight - scaffoldPadding;
  }

  static MediaQueryData get mediaQueryData => _mediaQueryData;

  /// The number of font pixels for each logical pixel.
  static double get textScaleFactory => _textScaleFactor;

  /// The size of the media in logical pixels (e.g, the size of the screen).
  static double get pixelRatio => _pixelRatio;

  /// The horizontal extent of this size.
  static double get screenWidthDp => _screenWidth;

  ///The vertical extent of this size. dp
  static double get screenHeightDp => _screenHeight;

  /// The vertical extent of this size. px
  static double get screenWidth => _screenWidth * _pixelRatio;

  /// The vertical extent of this size. px
  static double get screenHeight => _screenHeight * _pixelRatio;

  /// The offset from the top
  static double get statusBarHeight => _statusBarHeight;

  /// The offset from the bottom.
  static double get bottomBarHeight => _bottomBarHeight;

  /// The height of the body without status & app bars and bottomPadding(8).
  static double get bodyHeight => _bodyHeight;

  /// The height of the body without status & app bars and bottomPadding(8) and bottomNavigation.
  static double get bodyHeightWithBottomNavigation => _bodyHeightWithBottomNavigation;

  /// The ratio of the actual dp to the design draft px
  get scaleWidth => _screenWidth / _instance.width;

  get scaleHeight => _screenHeight / _instance.height;

  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  setWidth(num width) => width * scaleWidth;

  /// Highly adaptable to the device according to UI Design
  /// It is recommended to use this method to achieve a high degree of adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current style effect, or if there is a difference in shape.
  setHeight(num height) => height * scaleHeight;

  setWidthInt(num width) => (width * scaleWidth).toInt();

  setHeightInt(num height) => (height * scaleHeight).toInt();

  ///Font size adaptation method
  ///@param [fontSize] The size of the font on the UI design, in px.
  ///@param [allowFontScaling]
  setSp(num fontSize) => allowFontScaling ? setWidth(fontSize) : setWidth(fontSize) / _textScaleFactor;
}
