import 'package:flutter/material.dart';



Mydrawer(String text,IconData icons,int color,int selec, int _selectedIndex,fun,int selecteditem,VoidCallback  ontap) {
  return ListTile(
    title: Text(text,
      style: const TextStyle(color: Colors.white),
    ),
    leading: Icon(
      icons,
      color: Color(color),
    ),
    selected:selec == _selectedIndex,
    onTap: () {
      fun(selecteditem);

    },
  );


}
