import 'dart:ffi';

import 'package:budget_app/AddTaskScreen/add_screen.dart';
import 'package:budget_app/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "TODOOO",
        theme: ThemeData(
          fontFamily: 'Montserrat',
        ),
        home: HomeScreen(),
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(child: HomeScreen()),
//         floatingActionButton: FloatingActionButton.extended(
//           onPressed: () {},
//           label: Text("New Task"),
//           icon: Icon(Icons.add),
//           backgroundColor: Colors.black,
//         ),
//       ),
//     );
//   }
// }
