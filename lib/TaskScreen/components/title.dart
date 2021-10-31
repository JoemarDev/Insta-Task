import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  final String _title;

  TaskTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        _title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }
}
