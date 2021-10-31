import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

InkWell TaskDatePicker(
    BuildContext context, Function selectedDate, DateTime DateText) {
  return InkWell(
    onTap: () {
      selectedDate(context);
      FocusScope.of(context).unfocus();
    },
    child: ListTile(
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      leading: Icon(Icons.calendar_today),
      title: Text(
        DateFormat.yMMMEd().format(DateText),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    ),
  );
}
