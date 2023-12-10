// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../utils/extensions/extensions.dart';

class NoImagePersonWidget extends StatelessWidget {
  double width, height;

  NoImagePersonWidget(this.width, this.height, {Key key}) : super(key: key);

  // const NoImagePersonWidget({
  //   Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/anonymous.jpg',
      height: height.scaleByWidth(),
      width: width.scaleByWidth(),
      fit: BoxFit.fill,
    );
  }
}

class NoImageGenericWidget extends StatelessWidget {
  double width, height;

  NoImageGenericWidget(this.width, this.height, {Key key}) : super(key: key);

  // const NoImageGenericWidget({
  //   Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/empty-photo.jpg',
      height: height.scaleByWidth(),
      width: width.scaleByWidth(),
      fit: BoxFit.fill,
    );
  }
}
