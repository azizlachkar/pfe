// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp2/Service_Request/second.dart';
import 'package:myapp2/Workorder/Create_WO.dart';
import 'package:myapp2/Workorder/ListWO.dart';
import '../Classes/workorders.dart';
import '../Service_Request/Demande_de_service.dart';
import 'package:http/http.dart' as http;

class WorkOrderScreen extends StatefulWidget {
  const WorkOrderScreen({Key? key}) : super(key: key);

  @override
  _WorkOrder createState() => _WorkOrder();
}

class _WorkOrder extends State<WorkOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Work Order'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Second()))),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => demandeWO()));
                    },
                    icon: Icon(
                      Icons.add,
                      size: 22,
                    ),
                    label: Text("Create Intervention")),
                Padding(
                  padding: const EdgeInsets.all(5),
                ),
                Container(color: Colors.blue),
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkorderFromAPI()));
                    },
                    icon: Icon(
                      Icons.list,
                      size: 22,
                    ),
                    label: Text("Liste des Interventions")),
              ],
            ),
          ),
        ));
  }
}
