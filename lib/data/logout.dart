import 'package:flutter/material.dart';
import '../data/menu_item.dart';
import '../Classes/menu.dart';
import '../main.dart';

PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem(
      value: item,
      child: Row(
        children: [
          Icon(
            item.icon,
            color: Colors.black,
            size: 20,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(item.text),
        ],
      ),
    );
void onSelected(BuildContext context, MenuItem item) {
  switch (item) {
    case MenuItems.itemSignOut:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );

      break;
  }
}
