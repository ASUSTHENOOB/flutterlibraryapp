import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField2 extends StatelessWidget {
  final String hintName;
  final bool obsecuretext;
  TextEditingController controller;
  MyTextField2(
      {super.key,
      required this.hintName,
      required this.controller,
      required this.obsecuretext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      child: Column(
        children: [
          Container(
            // height: 40,
            child: TextFormField(
              style: TextStyle(color: const Color.fromARGB(255, 135, 133, 133)),
              obscureText: obsecuretext,
              controller: controller,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 95, 159, 129)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 95, 159, 129)),
                  ),
                  hintText: hintName,
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 95, 159, 129))),
            ),
          ),
          SizedBox(
            height: 3,
          )
        ],
      ),
    );
  }
}
