// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DbPage extends StatefulWidget {
  const DbPage({super.key});

  @override
  State<DbPage> createState() => _DbPageState();
}

class _DbPageState extends State<DbPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> insertrecord() async {
    try {
      var res = await http.post(
          Uri.parse("http://192.168.100.9/libApi/insertrecord.php"),
          body: {
            "name": name.text,
            "email": email.text,
            "password": password.text
          });
      var response = jsonDecode(res.body);
      if (res.statusCode == 200) {
        print("insert........");
      } else {
        print("Not Inserted............");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          TextFormField(
            controller: name,
            decoration: InputDecoration(hintText: "Name"),
          ),
          TextFormField(
            controller: email,
            decoration: InputDecoration(hintText: "Email"),
          ),
          TextFormField(
            controller: password,
            decoration: InputDecoration(hintText: "Password"),
          ),
          ElevatedButton(
              onPressed: () {
                insertrecord();
              },
              child: Text("Inset"))
        ]),
      ),
    );
  }
}
