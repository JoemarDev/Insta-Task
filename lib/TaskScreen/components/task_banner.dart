import 'package:budget_app/models/placeholder.dart';
import 'package:budget_app/models/task.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class TaskScreenBanner extends StatelessWidget {
  const TaskScreenBanner({
    Key? key,
    required List taskOject,
  })  : _taskOject = taskOject,
        super(key: key);

  final List _taskOject;

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    int randomNumber = random.nextInt(motto.length);

    getTaskCount() {
      if (_taskOject[0].id == 1) {
        if (tasks.where((element) => element.status == 0).length == 0) {
          return motto[randomNumber].text;
        }
        return '${tasks.length} Task';
      } else {
        var taskCount = tasks
            .where((element) =>
                element.category == _taskOject[0].id && element.status == 0)
            .length;
        if (taskCount == 0) {
          return motto[randomNumber].text;
        }
        return ' ${taskCount} Task';
      }
    }

    return Container(
      decoration: BoxDecoration(color: Colors.black),
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Card(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Hero(
                    tag: _taskOject[0].id,
                    child: Image.asset(
                      _taskOject[0].image,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(_taskOject[0].title,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                  subtitle: Text(
                    ' ${getTaskCount()}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
