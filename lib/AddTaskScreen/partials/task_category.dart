import 'package:budget_app/models/menu.dart';
import 'package:flutter/material.dart';

ListTile Category(BuildContext context, Widget getCatIcon(dynamic value),
    int CatSelectedValue, Function handleCategory) {
  List _dataMenu = categories_data.where((element) => element.id != 1).toList();

  return ListTile(
    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
    horizontalTitleGap: 0,
    contentPadding: EdgeInsets.all(5),
    leading: Hero(
      tag: categories_data[CatSelectedValue + 1].id,
      child: getCatIcon(CatSelectedValue),
    ),
    title: DropdownButton(
      onTap: () => FocusScope.of(context).unfocus(),
      isExpanded: true,
      // dropdownColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.transparent,
      ),
      hint: Container(
        child: Text(
          "Pick Category",
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 17),
          textAlign: TextAlign.start,
        ),
      ),
      items: _dataMenu.map((value) {
        return DropdownMenuItem(
          child: Row(
            children: [
              SizedBox(width: 10),
              Text(
                value.title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 17),
                textAlign: TextAlign.start,
              )
            ],
          ),
          value: _dataMenu.indexOf(value),
        );
      }).toList(),
      value: CatSelectedValue,
      onChanged: (val) {
        handleCategory(val);
        FocusScope.of(context).unfocus();
      },
    ),
  );
}
