import 'package:flutter/material.dart';

ListTile TaskNote(TextEditingController taskNote) {
  return ListTile(
    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
    horizontalTitleGap: 0,
    contentPadding: EdgeInsets.all(5),
    leading: Icon(Icons.note),
    title: TextField(
      controller: taskNote,
      decoration: InputDecoration(
        filled: false,
        hintText: "Add Note",
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        border: InputBorder.none,
      ),
    ),
  );
}
