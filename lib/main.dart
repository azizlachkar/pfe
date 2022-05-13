// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, non_constant_identifier_names
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:myapp2/Service_Request/loading.dart';
import 'package:myapp2/Service_Request/second.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<Login> {
  var emailControler = TextEditingController();
  var passControler = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(title: Text('Maximo APP')),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SafeArea(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 100),
                      child: Image(
                        image: AssetImage("assets/mx_icon_iot18.png"),
                      ),
                    ),
                    TextFormField(
                      controller: emailControler,
                      obscureText: false,
                      decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.email)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: passControler,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.lock)),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          Login();
                        },
                        icon: Icon(
                          Icons.login,
                          size: 18,
                        ),
                        label: Text("login")),
                    Container(color: Colors.blue)
                  ],
                )),
              ),
            )));
  }

  // base64 encoding a string

  encode() {
    String credentials = emailControler.text + ":" + passControler.text;
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(credentials);
    return (encoded);
  }

  //Login POST API CALL
  Future<void> Login() async {
    if (passControler.text.isNotEmpty && emailControler.text.isNotEmpty) {
      setState(() => loading = true);
      var response = await http.post(
          Uri.parse("http://192.168.1.30:9080/maximo/rest/login"),
          headers: ({
            'MAXAUTH': encode(),
          }));
      if (response.statusCode == 200) {
        setState(() => loading = true);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Second()));
      } else {
        setState(() => loading = false);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid cords!")));
      }
    } else {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Empty fields are not allowed !")));
    }
  }
}
