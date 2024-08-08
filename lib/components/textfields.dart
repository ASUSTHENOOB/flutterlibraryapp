import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  final String hintName;
  final bool obsecuretext;
  TextEditingController controller;
  MyTextField(
      {super.key,
      required this.hintName,
      required this.controller,
      required this.obsecuretext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(color: const Color.fromARGB(255, 135, 133, 133)),
            obscureText: obsecuretext,
            controller: controller,
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 95, 159, 129)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                hintText: hintName,
                fillColor: Colors.grey.shade200,
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[500])),
          ),
          SizedBox(
            height: 3,
          )
        ],
      ),
    );
  }
}
