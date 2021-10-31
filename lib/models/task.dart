import 'package:flutter/material.dart';

class Task {
  late int id;
  late String title;
  late int category;
  late String note;
  late TimeOfDay time;
  late DateTime date;
  late int status = 0;

  Task({
    required this.id,
    required this.title,
    required this.category,
    required this.note,
    required this.time,
    required this.date,
  });
}

List<Task> tasks = [];
