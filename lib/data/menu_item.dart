import 'package:flutter/material.dart';
import '../Classes/menu.dart';

class MenuItems {
  static const List<MenuItem> itemsFirst = [
    itemSignOut,
  ];
  static const itemSignOut = MenuItem(
    text: 'Sign Out',
    icon: Icons.logout,
  );
}
