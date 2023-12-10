import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:flutter/material.dart';
import '../utils/dimensions.dart';

class SuccessDialog extends StatefulWidget {
  final String title, subTitle, buttonName;
  final Widget moved;
  const SuccessDialog({Key key, this.title, this.subTitle, this.buttonName, this.moved}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SuccessDialogState createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.check, color: CustomColor.primaryColor, size: Dimensions.extraLargeTextSize),
            Text(
              '${widget.title}!',
              style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: CustomColor.primaryColor,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.subTitle,
              style: TextStyle(
                fontSize: Dimensions.largeTextSize,
                color: CustomColor.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              child: Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: CustomColor.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))),
                child: Center(
                  child: Text(
                    widget.buttonName.toUpperCase(),
                    style: TextStyle(
                        fontSize: Dimensions.extraLargeTextSize, color: Colors.white, fontWeight: FontWeight.bold),
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
