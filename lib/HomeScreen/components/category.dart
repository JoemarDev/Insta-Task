import 'package:budget_app/TaskScreen/task_screen.dart';
import 'package:budget_app/models/menu.dart';
import 'package:budget_app/models/task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ViewPage(int cat_ID) {
      Get.to(() => TaskScreen(cat_ID));
    }

    GetTaskCount(id) {
      var taskCount = tasks
          .where((element) => element.category == id && element.status != 1)
          .toList()
          .length;

      if (id == 1) {
        taskCount = tasks.where((element) => element.status != 1).length;
      }

      if (taskCount == 0) {
        return "No Task";
      } else {
        return taskCount.toString() + " Task";
      }
    }

    return Container(
      child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: categories_data.map((data) {
            return Container(
              child: InkWell(
                onTap: () => ViewPage(data.id),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 20, 10, 0),
                          child: Hero(
                            tag: data.id,
                            child: Image.asset(
                              data.image,
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          data.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(GetTaskCount(data.id)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList()),
    );
  }
}
