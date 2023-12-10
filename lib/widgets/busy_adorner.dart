import 'package:flutter/material.dart';

class BusyAdorner extends StatelessWidget {
  final BoxDecoration boxDecoration;
  final Color progressIndicatorColor;
  final bool showStaticText;
  const BusyAdorner({Key key, this.boxDecoration, this.progressIndicatorColor, this.showStaticText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: showStaticText
            ? const Text("Lütfen Bekleyiniz...")
            : CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(progressIndicatorColor ?? Theme.of(context).primaryColor),
              ),
      ),
    );
  }
}
