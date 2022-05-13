// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unused_import, non_constant_identifier_names, deprecated_member_use, empty_statements, prefer_const_constructors, avoid_print, unused_local_variable, avoid_types_as_parameter_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myapp2/Service_Request/SR.dart';
import '../Classes/demandes.dart';
import 'package:http/http.dart' as http;
import './ListeSR.dart';
import '../data/logout.dart';
import '../Classes/menu.dart';
import '../data/menu_item.dart';

class SrDetailsScreen extends StatefulWidget {
  final Sr sr;
  SrDetailsScreen({Key? key, required this.sr}) : super(key: key);

  @override
  State<SrDetailsScreen> createState() => _SrDetailsScreenState();
}

class _SrDetailsScreenState extends State<SrDetailsScreen> {
  Future<Demandes?> UpdateData(String ticketid, description, ASSETNUM, location,
      status, DESCRIPTION_LONGDESCRIPTION, Ticketuid) async {
    var respone = await http.post(
        Uri.parse(
            'http://192.168.1.30:9080/maxrest/rest/mbo/sr/${widget.sr.attributes.ticketuid.content}/?_lid=azizl&_lpwd=max12345m&_format=json'),
        body: ({
          "DESCRIPTION": description,
          "ASSETNUM": ASSETNUM,
          "location": location,
          "DESCRIPTION_LONGDESCRIPTION": DESCRIPTION_LONGDESCRIPTION,
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

  TextEditingController ticketidController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController LocationController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController Assetsiteid = TextEditingController();
  TextEditingController AssetnumController = TextEditingController();
  TextEditingController LONGDESCRIPTIONController = TextEditingController();

  @override
  void initState() {
    descriptionController.text = '${widget.sr.attributes.description?.content}';
    AssetnumController.text = '${widget.sr.attributes.assetnum?.content}';
    Assetsiteid.text = '${widget.sr.attributes.assetsiteid?.content}';
    LocationController.text = '${widget.sr.attributes.location?.content}';
    statusController.text = '${widget.sr.attributes.status.content}';
    LONGDESCRIPTIONController.text =
        '${widget.sr.attributes.DESCRIPTION_LONGDESCRIPTION?.content}';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "TICKET ID : ${widget.sr.attributes.ticketid.content} ",
        ),
        actions: [
          PopupMenuButton<MenuItem>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) =>
                [...MenuItems.itemsFirst.map(buildItem).toList()],
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Ticket id:\n${widget.sr.attributes.ticketid.content}',
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
                  child: const Text('Submit',
                      style: TextStyle(color: Colors.white)),
                  color: Theme.of(context).primaryColor,
                  onPressed: () async {
                    String DESCRIPTION = descriptionController.text;
                    String ASSETNUM = AssetnumController.text;
                    String location = LocationController.text;
                    String DESCRIPTION_LONGDESCRIPTION =
                        LONGDESCRIPTIONController.text;
                    String status = statusController.text;
                    String ticketid = widget.sr.attributes.reportedby.content;

                    Demandes? data = await UpdateData(
                      ticketid,
                      DESCRIPTION,
                      ASSETNUM,
                      location,
                      DESCRIPTION_LONGDESCRIPTION,
                      status,
                      Ticketuid,
                    );
                  }),
            ),
            Container(
              width: double.infinity,
              height: 35,
              margin: EdgeInsets.only(top: 20),
              child: RaisedButton(
                child: const Text("Create Intervention",
                    style: TextStyle(color: Colors.white)),
                color: Theme.of(context).primaryColor,
                onPressed: () {},
                padding: const EdgeInsets.all(5),
              ),
            ),
            Container(
              width: double.infinity,
              height: 35,
              margin: EdgeInsets.only(top: 20),
              child: RaisedButton(
                child:
                    const Text("Reset", style: TextStyle(color: Colors.white)),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  TextField(
                    controller: descriptionController,
                  );
                },
                padding: const EdgeInsets.all(5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
