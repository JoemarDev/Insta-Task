import 'package:budget_app/models/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Late extends StatelessWidget {
  List<Task> _lateTask;
  VoidCallback _update;

  Late(this._lateTask, this._update);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: _lateTask.map((value) {
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: ListTile(
              title: Text(
                value.title,
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
              subtitle: Text(
                "${value.time.format(context)}  ${DateFormat.MMMEd().format(value.date)}",
                style: TextStyle(color: Colors.red),
              ),
              trailing: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onChanged: (_) {
                  tasks[tasks.indexWhere(
                          (element) => element.id == _lateTask[0].id)]
                      .status = 1;
                  _update();
                },
                value: false,
              ),
            ),
            actions: <Widget>[
              IconSlideAction(
                caption: 'Done',
                color: Colors.black,
                icon: Icons.done,
                onTap: () {
                  tasks[tasks.indexWhere(
                          (element) => element.id == _lateTask[0].id)]
                      .status = 1;
                  _update();
                },
              ),
              IconSlideAction(
                caption: 'Remove',
                color: Colors.black,
                icon: Icons.close,
                onTap: () {
                  tasks.removeWhere((element) => element.id == _lateTask[0].id);
                },
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
