import 'package:flutter/material.dart';

Widget PickerTheme(context, child) {
  return Theme(
    data: Theme.of(context).copyWith(
      colorScheme: ColorScheme.light(
        primary: Colors.black, // header background color
        onPrimary: Colors.white, // header text color
        onSurface: Colors.black, // body text color
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.black, // button text color
        ),
      ),
    ),
    child: child!,
  );
}
