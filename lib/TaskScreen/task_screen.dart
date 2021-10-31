import 'package:budget_app/AddTaskScreen/add_screen.dart';
import 'package:budget_app/HomeScreen/home_screen.dart';
import 'package:budget_app/TaskScreen/components/done_task.dart';
import 'package:budget_app/TaskScreen/components/late.dart';
import 'package:budget_app/TaskScreen/components/today.dart';
import 'package:budget_app/TaskScreen/components/title.dart';
import 'package:budget_app/TaskScreen/components/task_banner.dart';
import 'package:budget_app/main.dart';
import 'package:budget_app/models/menu.dart';
import 'package:budget_app/models/task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskScreen extends StatefulWidget {
  final int _task_ID;

  TaskScreen(this._task_ID);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen>
    with SingleTickerProviderStateMixin {
  AddTask() {
    Get.to(() => AddScreen());
  }

  List<Task> get _lateTransaction {
    return tasks.where((t) {
      if (t.category != widget._task_ID) {
        if (widget._task_ID != 1) return false;
      }

      if (t.status != 0) {
        return false;
      }

      double task_time = t.time.hour + t.time.minute / 60;
      double now_time = TimeOfDay.now().hour + TimeOfDay.now().minute / 60;

      bool isTimeLate = task_time < now_time;
      bool isDateLate = t.date.isBefore(DateTime.now());
      if (isTimeLate && isDateLate) {
        return true;
      } else {
        return false;
      }
    }).toList();
  }

  List<Task> get _todayTask {
    return tasks.where((t) {
      if (t.category != widget._task_ID) {
        if (widget._task_ID != 1) return false;
      }

      if (t.status != 0) {
        return false;
      }

      double task_time = t.time.hour + t.time.minute / 60;
      double now_time = TimeOfDay.now().hour + TimeOfDay.now().minute / 60;
      bool isTaskLater = task_time >= now_time;
      bool isTaskToday = DateFormat('MM/dd/yyy').format(t.date) ==
          DateFormat('MM/dd/yyy').format(DateTime.now());

      if (isTaskLater && isTaskToday) {
        return true;
      } else {
        return false;
      }
    }).toList();
  }

  List<Task> get _doneTask {
    return tasks.where((t) {
      if (t.category != widget._task_ID) {
        if (widget._task_ID != 1) return false;
      }

      if (t.status == 0) {
        return false;
      } else {
        return true;
      }
    }).toList();
  }

  @override
  void update() {
    setState(() {});
  }

  Tween<double> _marginTop = Tween<double>(begin: 150, end: 0);

  @override
  Widget build(BuildContext context) {
    List<Menu> _taskOject = categories_data
        .where((element) => element.id == widget._task_ID)
        .toList();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: AddTask,
        label: Text("New Task"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 0, color: Colors.black),
                bottom: BorderSide(width: 0, color: Colors.white),
              ),
              color: Colors.black,
            ),
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.black),
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black.withOpacity(0.2),
                      ),
                    ),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      Get.offAll(() => HomeScreen());
                    },
                  ),
                ),
                TaskScreenBanner(taskOject: _taskOject),
                Container(
                  margin: EdgeInsets.only(top: 0),
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 0, color: Colors.black),
                      bottom: BorderSide(width: 0, color: Colors.white),
                    ),
                    color: Colors.black,
                  ),
                  child: TweenAnimationBuilder(
                    curve: Curves.easeInOutQuart,
                    tween: _marginTop,
                    duration: Duration(milliseconds: 600),
                    builder: (context, double size, child) {
                      return Container(
                        margin: EdgeInsets.only(top: size),
                        padding: EdgeInsets.all(30),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          border: Border.all(width: 0, color: Colors.white),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Late Task
                            if (_lateTransaction.isNotEmpty) TaskTitle('Late'),
                            if (_lateTransaction.isNotEmpty)
                              Late(_lateTransaction, update),
                            if (_lateTransaction.isNotEmpty)
                              SizedBox(height: 30),
                            // Late Task
                            // Today Task
                            if (_todayTask.isNotEmpty) TaskTitle('Today'),
                            if (_todayTask.isNotEmpty)
                              Today(_todayTask, update),
                            if (_todayTask.isNotEmpty) SizedBox(height: 30),
                            // Today Task
                            if (_doneTask.isNotEmpty) TaskTitle('Done'),
                            if (_doneTask.isNotEmpty)
                              DoneTask(_doneTask, update),
                            if (_lateTransaction.isEmpty &&
                                _doneTask.isEmpty &&
                                _todayTask.isEmpty)
                              Center(
                                child: Image.asset(
                                  'assets/images/rest.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                ),
                              ),
                            if (_lateTransaction.isEmpty &&
                                _doneTask.isEmpty &&
                                _todayTask.isEmpty)
                              Center(
                                child: Text("No Task History"),
                              ),
                          ],
                        ),
                      );
                    },
                    child: Container(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
