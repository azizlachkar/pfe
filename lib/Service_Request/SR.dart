// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp2/Service_Request/second.dart';
import 'package:myapp2/main.dart';
import 'Demande_de_service.dart';
import 'ListeSR.dart';
import '../data/menu_item.dart';
import '../Classes/menu.dart';
import '../data/logout.dart';
import '../Service_Request/test.dart';

class SR extends StatefulWidget {
  @override
  _ServiceRequset createState() => _ServiceRequset();
}

class _ServiceRequset extends State<SR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Service Request'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Second()))),
          actions: [
            PopupMenuButton<MenuItem>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) =>
                  [...MenuItems.itemsFirst.map(buildItem).toList()],
            )
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Demandes()));
                    },
                    icon: Icon(
                      Icons.add,
                      size: 22,
                    ),
                    label: Text("Create Service Request")),
                Padding(
                  padding: const EdgeInsets.all(5),
                ),
                Container(color: Colors.blue),
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DataFromAPI()));
                    },
                    icon: Icon(
                      Icons.list,
                      size: 22,
                    ),
                    label: Text("Liste de service requests")),
              ],
            ),
          ),
        ));
  }
}
