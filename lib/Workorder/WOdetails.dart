// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unused_import, non_constant_identifier_names, deprecated_member_use, empty_statements, prefer_const_constructors, avoid_print, unused_local_variable, avoid_types_as_parameter_names, unnecessary_string_interpolations

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myapp2/Classes/workorders.dart';
import 'package:myapp2/Service_Request/SR.dart';
import 'package:http/http.dart' as http;
import '../Classes/demandes.dart';
import '../Classes/workorders.dart';
import './ListWO.dart';

class WODetailsScreen extends StatefulWidget {
  final Workorder workorder;
  WODetailsScreen({Key? key, required this.workorder}) : super(key: key);

  @override
  State<WODetailsScreen> createState() => _WODetailsScreenState();
}

class _WODetailsScreenState extends State<WODetailsScreen> {
  Future<Workorders?> UpdateData(String wonum, description, ASSETNUM, location,
      status, DESCRIPTIONLONGDESCRIPTION, Workorderid) async {
    var respone = await http.post(
        Uri.parse(
            'http://192.168.1.30:9080/maxrest/rest/mbo/workorder/${widget.workorder.attributes.workorderid.content}/?_lid=azizl&_lpwd=max12345m&_format=json'),
        body: ({
          "DESCRIPTION": description,
          "ASSETNUM": ASSETNUM,
          "location": location,
          "DESCRIPTION_LONGDESCRIPTION": DESCRIPTIONLONGDESCRIPTION,
          "status": status,
        }));
    var data = respone.body;
    print(data);
    if (respone.statusCode == 204) {
    } else {
      return null;
    }
    return null;
  }

  TextEditingController wonumController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController LocationController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController Assetsiteid = TextEditingController();
  TextEditingController AssetnumController = TextEditingController();
  TextEditingController LONGDESCRIPTIONController = TextEditingController();

  @override
  void initState() {
    descriptionController.text =
        '${widget.workorder.attributes.description?.content}';
    AssetnumController.text =
        '${widget.workorder.attributes.assetnum?.content}';
    Assetsiteid.text = '${widget.workorder.attributes.assetnum?.content}';
    LocationController.text =
        '${widget.workorder.attributes.location?.content}';
    statusController.text = '${widget.workorder.attributes.status.content}';
    LONGDESCRIPTIONController.text =
        '${widget.workorder.attributes.descriptionLongdescription?.content}';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "TICKET ID : ${widget.workorder.attributes.wonum.content} ",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Ticket id:\n${widget.workorder.attributes.wonum.content}',
              style: const TextStyle(fontSize: 15),
            ),
            const Divider(),
            Padding(padding: EdgeInsets.all(10)),
            Text("Description"),
            TextField(
              controller: descriptionController,
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text("Details"),
            TextField(
              controller: LONGDESCRIPTIONController,
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text("Status"),
            TextField(
              controller: statusController,
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text("Asset Num"),
            TextField(
              controller: AssetnumController,
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text("Asset site id "),
            TextField(
              controller: Assetsiteid,
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text("Location"),
            TextField(
              controller: LocationController,
            ),
            Padding(padding: EdgeInsets.all(10)),
            SizedBox(
              width: double.infinity,
              height: 35,
              child: RaisedButton(
                child:
                    const Text('Submit', style: TextStyle(color: Colors.white)),
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  String DESCRIPTION = descriptionController.text;
                  String ASSETNUM = AssetnumController.text;
                  String location = LocationController.text;
                  String DESCRIPTION_LONGDESCRIPTION =
                      LONGDESCRIPTIONController.text;
                  String status = statusController.text;
                  String interventionid =
                      widget.workorder.attributes.wonum.content;

                  Workorders? data = await UpdateData(
                    interventionid,
                    DESCRIPTION,
                    ASSETNUM,
                    location,
                    DESCRIPTION_LONGDESCRIPTION,
                    status,
                    Workorderid,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
