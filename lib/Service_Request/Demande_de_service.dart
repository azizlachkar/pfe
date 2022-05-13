// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, curly_braces_in_flow_control_structures, non_constant_identifier_names, unused_field, avoid_print

import '../Classes/demandes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/menu_item.dart';
import '../Classes/menu.dart';
import '../data/logout.dart';

class Demandes extends StatefulWidget {
  @override
  _demande createState() => _demande();
}

class _demande extends State<Demandes> {
  Future<Demandes?> submitData(String description, ASSETNUM, location,
      DESCRIPTION_LONGDESCRIPTION) async {
    var respone = await http.post(
        Uri.parse(
            'http://192.168.1.30:9080/maxrest/rest/mbo/sr/?_lid=azizl&_lpwd=max12345m&_format=json'),
        body: {
          "description": description,
          "ASSETNUM": ASSETNUM,
          "location": location,
          "DESCRIPTION_LONGDESCRIPTION": DESCRIPTION_LONGDESCRIPTION,
        });
    var data = respone.body;
    print(data);
    if (respone.statusCode == 201) {
      dynamic responseString = respone.body;
      azizFromJson(responseString);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Demande de service Cree")));
    } else
      return null;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("error")));
    return null;
  }

  late Demandes? _demandes;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController ASSETNUMController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController DESCRIPTION_LONGDESCRIPTIONController =
      TextEditingController();

  Widget DescriptionTextField() {
    return TextField(
      decoration: InputDecoration(
        // labelText: "Description",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      controller: descriptionController,
    );
  }

  Widget AssetTextField() {
    return TextField(
      decoration: InputDecoration(
        //   labelText: "Asset",
        border: OutlineInputBorder(),
      ),
      controller: ASSETNUMController,
    );
  }

  Widget DeatialsTextField() {
    return TextField(
      decoration: InputDecoration(
        //  labelText: "Details",
        border: OutlineInputBorder(),
      ),
      maxLines: 10,
      controller: DESCRIPTION_LONGDESCRIPTIONController,
    );
  }

  Widget LocationTextField() {
    return TextField(
      decoration: InputDecoration(
        //  labelText: "Location",
        border: OutlineInputBorder(),
      ),
      controller: locationController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Creation Demande de service'),
          actions: [
            PopupMenuButton<MenuItem>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) =>
                  [...MenuItems.itemsFirst.map(buildItem).toList()],
            )
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(8),

          // ignore: prefer_const_literals_to_create_immutables
          children: [
            ListTile(
              title: Text("Description"),
            ),
            DescriptionTextField(),
            ListTile(
              title: Text("Details"),
            ),
            DeatialsTextField(),
            ListTile(title: Text("Asset")),
            AssetTextField(),
            ListTile(
              title: Text("Location"),
            ),
            LocationTextField(),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: (() async {
                String description = descriptionController.text;
                String ASSETNUM = ASSETNUMController.text;
                String location = locationController.text;
                String DESCRIPTION_LONGDESCRIPTION =
                    DESCRIPTION_LONGDESCRIPTIONController.text;
                Demandes? data = await submitData(description, ASSETNUM,
                    location, DESCRIPTION_LONGDESCRIPTION);
                setState(() {
                  _demandes = data;
                });
              }),
              child: Text("submit "),
            )
          ],
        ));
  }
}
