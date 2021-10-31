import 'package:budget_app/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DoneTask extends StatelessWidget {
  final List<Task> _doneTask;
  final Function _update;
  DoneTask(this._doneTask, this._update);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: _doneTask.map((value) {
        return Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: ListTile(
            title: Text(
              value.title,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w900,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            subtitle: Text(timeago.format(value.date)),
          ),
          actions: <Widget>[
            IconSlideAction(
              caption: 'Remove',
              color: Colors.black,
              icon: Icons.close,
              onTap: () {
                tasks.removeWhere((element) => element.id == _doneTask[0].id);
                _update();
              },
            ),
          ],
        );
      }).toList(),
    ));
  }
}
