// ignore_for_file: unnecessary_new, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Classes/assets.dart';

void main() {
  runApp(MaterialApp(
    home: App(),
  ));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  //country
  List assets_data = [];

  String? assetid; //default id for the dropdown
  //its null for me you can copy an id from api and place here it will be seen....
  Future<String> country() async {
    var res = await http.get(Uri.parse(
        "http://192.168.1.30:9080/maxrest/rest/mbo/asset/?_lid=azizl&_lpwd=max12345m&_format=json")); //if you have any auth key place here...properly..
    var resBody = json.decode(res.body);
    print(resBody);
    setState(() {
      assets_data = resBody;
    });

    return "Sucess";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    country();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown #API"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
          padding: const EdgeInsets.all(15.0), //some padding
          child: Column(
            children: <Widget>[
              DecoratedBox(
                  decoration: BoxDecoration(
                      border: new Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                    //Why you have used Stack ??????
                    //B'coz it make clickable to whole decorated Box!!!! as you can click anywhere for dropdown !!!
                    child: Stack(
                      children: <Widget>[
//Country Text
                        const Text(
                          "Asset :",
                          // ignore: unnecessary_const
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),

//Dropdown that has no loine beneath

                        DropdownButtonHideUnderline(
                          child:

//starting the dropdown
                              DropdownButton(
                            items: assets_data.map((item) {
                              return new DropdownMenuItem(
                                  child: new Text(
                                    item[
                                        'ASSETNUM'], //Names that the api dropdown contains
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  value: item['ASSETNUM']
                                      .toString() //Id that has to be passed that the dropdown has.....
                                  //e.g   India (Name)    and   its   ID (55fgf5f6frf56f) somethimg like that....
                                  );
                            }).toList(),
                            onChanged: (newVal) async {
                              setState(() {
                                assetid = newVal as String?;
                                if (kDebugMode) {
                                  print(assetid.toString());
                                }
                              });
                            },
                            value:
                                001122, //pasing the default id that has to be viewed... //i havnt used something ... //you can place some (id)
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          )),
    );
  }
}
