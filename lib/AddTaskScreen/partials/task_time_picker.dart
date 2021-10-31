import 'package:flutter/material.dart';

InkWell TaskTimePicker(
    BuildContext context, Function selectTime, TimeOfDay selectedTime) {
  return InkWell(
    onTap: () {
      selectTime(context);
      FocusScope.of(context).unfocus();
    },
    child: ListTile(
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      leading: Icon(Icons.timer),
      title: Text(
        selectedTime.format(context),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    ),
  );
}
