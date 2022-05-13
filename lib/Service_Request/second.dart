// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:myapp2/main.dart';
import '../Planification/planification.dart';
import 'SR.dart';
import '../Workorder/WO.dart';
import '../data/menu_item.dart';
import '../Classes/menu.dart';
import '../data/logout.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome Maximo user !"),
            SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SR()));
                },
                icon: Icon(
                  Icons.add_task,
                  size: 18,
                ),
                label: Text("Service Request")),
            Padding(
              padding: const EdgeInsets.all(5),
            ),
            Container(color: Colors.blue),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WorkOrderScreen()));
                },
                icon: Icon(
                  Icons.add_task,
                  size: 18,
                ),
                label: Text("Intervention")),
            Padding(
              padding: const EdgeInsets.all(5),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlanificationWO()));
                },
                icon: Icon(
                  Icons.next_plan,
                  size: 18,
                ),
                label: Text("Planification")),
            Padding(
              padding: const EdgeInsets.all(5),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                icon: Icon(Icons.exit_to_app, size: 18),
                label: Text("Log out")),
            Padding(
              padding: const EdgeInsets.all(5),
            ),
          ],
        ),
      )),
    );
  }
}
