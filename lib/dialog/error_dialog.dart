import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class ErrorDialog extends StatefulWidget {
  final String title, subTitle, buttonName;
  final Widget moved;
  const ErrorDialog({Key key, this.title, this.subTitle, this.buttonName, this.moved}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ErrorDialogState createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CustomColor.primaryColor,
      content: Container(
        color: CustomColor.primaryColor,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.cancel_outlined, color: CustomColor.primaryColor, size: Dimensions.extraLargeTextSize),
            // Text(
            //   '${widget.title}!',
            //   style: TextStyle(
            //       fontSize: Dimensions.extraLargeTextSize,
            //       color: CustomColor.redColor,
            //       fontWeight: FontWeight.bold),
            //   textAlign: TextAlign.center,
            // ),
            Text(
              widget.subTitle,
              style: TextStyle(
                fontSize: Dimensions.largeTextSize,
                color: CustomColor.secondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              child: Container(
                margin: const EdgeInsets.all(16),
                // height: 60.0,
                // width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Text(
                      widget.buttonName.toUpperCase(),
                      style: TextStyle(
                          fontSize: Dimensions.largeTextSize, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              onTap: () {
                if (widget.moved == null) {
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget.moved));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
