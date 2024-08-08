// ignore_for_file: deprecated_member_use, must_be_immutable
import 'dart:convert';

import 'package:first_app/components/textfields.dart';
import 'package:first_app/screens/login_screen.dart';
import 'package:first_app/screens/main_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController regNocontroller = TextEditingController();
  TextEditingController snamecontroller = TextEditingController();
  TextEditingController fnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController deptcontroller = TextEditingController();
  TextEditingController semcontroller = TextEditingController();
  TextEditingController pnumcontroller = TextEditingController();
  TextEditingController addrcontroller = TextEditingController();
  TextEditingController coursecontroller = TextEditingController();
  TextEditingController ctitlecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  Future<void> fetchStudentName(String regNo) async {
    final response = await http.get(
      Uri.parse(
          'http://192.168.100.65/weblib/libApi/return.php?reg_no=${regNocontroller.text}'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['error'] == null) {
        snamecontroller.text = data['Name'];
      } else {
        Toast.show(data['error'],
            backgroundColor: Colors.red, gravity: Toast.bottom);
      }
    } else {
      Toast.show("Error fetching student name",
          backgroundColor: Colors.red, gravity: Toast.bottom);
    }
  }

  Future<void> InsertData() async {
    if (regNocontroller.text != "" &&
        snamecontroller.text != "" &&
        fnamecontroller.text != "" &&
        emailcontroller.text != "" &&
        deptcontroller.text != "" &&
        semcontroller.text != "" &&
        pnumcontroller.text != "" &&
        addrcontroller.text != "" &&
        coursecontroller.text != "" &&
        ctitlecontroller.text != "" &&
        passcontroller.text != "") {
      try {
        var req = await http.post(
            Uri.parse("http://192.168.0.106/libApi/insertrecord.php"),
            body: {
              "RegNo": regNocontroller.text,
              "SName": snamecontroller.text,
              "FName": fnamecontroller.text,
              "Email": emailcontroller.text,
              "Dept": deptcontroller.text,
              "Sem": semcontroller.text,
              "PNum": pnumcontroller.text,
              "Addr": addrcontroller.text,
              "Course": coursecontroller.text,
              "Dtitle": ctitlecontroller.text,
              "Pass": passcontroller.text,
            });
        if (req.statusCode == 200) {
          Toast.show(
            "Register Sucessfully",
            backgroundColor: Colors.green,
            gravity: Toast.bottom,
          );
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
          regNocontroller.text = "";
          snamecontroller.text = "";
          fnamecontroller.text = "";
          emailcontroller.text = "";
          deptcontroller.text = "";
          semcontroller.text = "";
          pnumcontroller.text = "";
          addrcontroller.text = "";
          coursecontroller.text = "";
          ctitlecontroller.text = "";
          passcontroller.text = "";
        } else {
          print("Error");
        }
      } catch (e) {
        print(e);
      }
    } else {
      Toast.show("please Fill All Fields",
          backgroundColor: Colors.red, gravity: Toast.bottom);
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 80,
                  width: 70,
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Text("Student",
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.titleLarge)),
                    Text("SignUp",
                        style: GoogleFonts.roboto(
                            textStyle:
                                Theme.of(context).textTheme.headlineSmall)),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              obsecuretext: false,
              hintName: "E.G => 20-cs-27",
              controller: regNocontroller,
            ),
            MyTextField(
              obsecuretext: false,
              hintName: "Antony Decosta",
              controller: snamecontroller,
            ),
            MyTextField(
              obsecuretext: false,
              hintName: "John Devillers",
              controller: fnamecontroller,
            ),
            MyTextField(
              obsecuretext: false,
              hintName: "example123@students.uoc.edu.pk",
              controller: emailcontroller,
            ),
            MyTextField(
              obsecuretext: false,
              hintName: "Computer Science",
              controller: deptcontroller,
            ),
            MyTextField(
              obsecuretext: false,
              hintName: "8th..",
              controller: semcontroller,
            ),
            MyTextField(
              obsecuretext: false,
              hintName: "03248781546",
              controller: pnumcontroller,
            ),
            MyTextField(
              obsecuretext: false,
              hintName: "888 Birch Court, Hamlet, State,USA",
              controller: addrcontroller,
            ),
            MyTextField(
              obsecuretext: false,
              hintName: "Bachelor",
              controller: coursecontroller,
            ),
            MyTextField(
              obsecuretext: false,
              hintName: "CS",
              controller: ctitlecontroller,
            ),
            MyTextField(
              obsecuretext: true,
              hintName: "Password",
              controller: passcontroller,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                InsertData();
              },
              child: Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 65),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 130, 128, 128),
                      offset: Offset(0.0, 9.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("SIGNUP Talha",
                      style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.labelLarge)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
