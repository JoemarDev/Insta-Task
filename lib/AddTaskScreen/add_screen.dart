import 'package:budget_app/AddTaskScreen/partials/task_category.dart';
import 'package:budget_app/AddTaskScreen/partials/task_date_picker.dart';
import 'package:budget_app/AddTaskScreen/partials/task_header.dart';
import 'package:budget_app/AddTaskScreen/partials/task_time_picker.dart';
import 'package:budget_app/AddTaskScreen/partials/theme/task_picker_theme.dart';
import 'package:budget_app/HomeScreen/home_screen.dart';
import 'package:budget_app/TaskScreen/task_screen.dart';
import 'package:budget_app/models/menu.dart';
import 'package:budget_app/models/task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'partials/task_note.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _task_title = TextEditingController();
  final _task_note = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  int currentSelectedValue = 0;
  int SelectedValue = 0;

  _handleCreateTask() {
    if (_task_title.text.length == 0) {
      return false;
    }

    if (_task_note.text.length == 0) {
      _task_note.text = 'No Note';
    }

    setState(() {
      tasks.insert(
          0,
          Task(
            id: tasks.length,
            title: _task_title.text,
            category: categories_data[SelectedValue + 1].id,
            note: _task_note.text,
            time: selectedTime,
            date: selectedDate,
          ));
    });

    Get.off(() => TaskScreen(categories_data[SelectedValue + 1].id));
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? timePicked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: PickerTheme,
    );

    if (timePicked != null && timePicked != selectedTime) {
      setState(() {
        selectedTime = timePicked;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: new DateTime.now(),
      lastDate: new DateTime.now().add(new Duration(days: 120)),
      builder: PickerTheme,
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  _handleCategory(newValue) {
    setState(() {
      SelectedValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    CloseScreen() {
      Navigator.pop(context);
    }

    getCatIcon(value) {
      if (value != null) {
        return Image.asset(
          categories_data[value + 1].image,
          width: 30,
          height: 30,
        );
      } else {
        return Icon(Icons.category);
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    TaskHeader(CloseScreen),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Title(
                              child: const Text(
                                "What are you planning ?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              color: Colors.red,
                            ),
                          ),
                          TextField(
                            controller: _task_title,
                            decoration: InputDecoration(
                                filled: false,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 40)),
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(height: 20),
                          TaskDatePicker(context, _selectDate, selectedDate),
                          TaskTimePicker(context, _selectTime, selectedTime),
                          TaskNote(_task_note),
                          Category(context, getCatIcon, SelectedValue,
                              _handleCategory),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontWeight: FontWeight.bold),
            primary: Colors.black,
            padding: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3), // <-- Radius
            ),
          ),
          onPressed: _handleCreateTask,
          child: const Text('Create Task'),
        ),
      ),
    );
  }
}
