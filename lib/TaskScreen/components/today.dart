import 'package:budget_app/models/task.dart';
import 'package:flutter/material.dart';

class Today extends StatelessWidget {
  List<Task> _todayTask;
  Function _update;
  Today(this._todayTask, this._update);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: _todayTask.map((task) {
          return (ListTile(
            title: Text(
              task.title,
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            subtitle: Text(task.time.format(context)),
            trailing: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              onChanged: (_) {
                tasks[tasks.indexWhere(
                        (element) => element.id == _todayTask[0].id)]
                    .status = 1;
                _update();
              },
              value: false,
            ),
          ));
        }).toList(),
      ),
    );
  }
}
