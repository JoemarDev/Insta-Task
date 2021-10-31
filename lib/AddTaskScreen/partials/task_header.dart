import 'package:flutter/material.dart';

Container TaskHeader(Null CloseScreen()) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
    width: double.infinity,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Text(
          "New Task",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Positioned(
          right: 0,
          child: InkWell(
            child: Icon(Icons.close, size: 25),
            onTap: CloseScreen,
          ),
        )
      ],
    ),
  );
}
