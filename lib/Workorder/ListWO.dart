// ignore_for_file: use_key_in_widget_constructors, avoid_print, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, prefer_const_constructors, non_constant_identifier_names, unnecessary_new, avoid_function_literals_in_foreach_calls, unused_import
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp2/Service_Request/SR.dart';
import 'package:myapp2/main.dart';
import 'package:myapp2/Service_Request/second.dart';
import '../Classes/workorders.dart';
import 'WO.dart';
import 'WOdetails.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WorkorderFromAPI(),
    );
  }
}

class WorkorderFromAPI extends StatefulWidget {
  @override
  _WorkorderFromAPIState createState() => _WorkorderFromAPIState();
}

List<Attributes> MyAllData = [];

class _WorkorderFromAPIState extends State<WorkorderFromAPI> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<Workorder>> loadData() async {
    try {
      var response = await http.get(Uri.parse(
          'http://192.168.1.30:9080/maxrest/rest/mbo/workorder/?_lid=azizl&_lpwd=max12345m&_format=json'));
      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        Workorders data = Workorders.fromJson(jsonBody);
        final woAttributes = data.workorderMboSet.workorder;
        return woAttributes;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    throw Exception("");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Liste des Interventions'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WorkOrderScreen()))),
        ),
        body: FutureBuilder<List<Workorder>?>(
          future: loadData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return new ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: ((_, index) {
                  return new ListTile(
                      title: new Card(
                        margin: new EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 8.0),
                        elevation: 10,
                        child: new ListTile(
                          title: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(padding: new EdgeInsets.all(2.0)),
                              new Text(
                                  'Workorder ID  : ${snapshot.data![index].attributes.wonum.content}'),
                              new Text(
                                  'status  : ${snapshot.data![index].attributes.status.content}'),
                              new Text(
                                  'description  : ${snapshot.data![index].attributes.description?.content}'),
                              new Text(
                                  'Asset num  : ${snapshot.data![index].attributes.assetnum?.content}'),
                            ],
                          ),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .push(
                              new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new WODetailsScreen(
                                        workorder: snapshot.data![index]),
                              ),
                            )
                            .then((data) {});
                      });
                }),
              );
            }
          },
        ),
      ),
    );
  }
}
