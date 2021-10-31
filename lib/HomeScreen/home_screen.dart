import 'package:budget_app/AddTaskScreen/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'components/category.dart';

class HomeScreen extends StatelessWidget {
  @override
  AddTask() {
    Get.to(() => AddScreen());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: AddTask,
        label: Text("New Task"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.black.withOpacity(0.2),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/menu.png',
                    width: 35,
                    height: 35,
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("Task",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
              ),
              const SizedBox(height: 15),
              Category(),
            ],
          ),
        ),
      ),
    );
  }
}
