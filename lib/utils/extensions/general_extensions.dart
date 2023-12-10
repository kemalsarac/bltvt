import 'package:flutter/material.dart';

import '../colors.dart';

extension GeneralExtensions on dynamic {
  bool inside(List<dynamic> values) {
    return values.contains(this);
  }

  bool get hasValue {
    return this != null;
  }

  bool get isNull {
    return this == null;
  }

  Theme dateTimePickerTheme(Widget child, BuildContext context) {
    // BuildContext context;
    return Theme(
      data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(
            primary: Theme.of(context).primaryColor,
            onPrimary: CustomColor.secondaryColor,
          ),
          dialogBackgroundColor: CustomColor.secondaryColor,
          scaffoldBackgroundColor: Theme.of(context).primaryColor,
          secondaryHeaderColor: CustomColor.secondaryColor),
      child: child,
    );
  }
}

extension BooleanExtensions on bool {
  bool getValueOrDefault() {
    return this ?? false;
  }
}
