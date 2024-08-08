import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(onSurface: Colors.grey.shade300),
  primaryColorLight: Color.fromARGB(255, 95, 159, 129),
  primaryColor: Color.fromARGB(255, 43, 73, 65),
  textTheme: TextTheme(
    headlineMedium: TextStyle(
        color: const Color.fromARGB(255, 255, 255, 255),
        fontSize: 15,
        // fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.25),
    titleSmall: TextStyle(
        color: Color.fromARGB(255, 43, 73, 65),
        fontSize: 12,
        // fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.25),
    headlineSmall: TextStyle(
        color: Color.fromARGB(255, 95, 159, 129),
        fontSize: 22,
        // fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.25),
    titleLarge: TextStyle(
        color: Color.fromARGB(255, 43, 73, 65),
        fontSize: 15,
        // fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.25),
    displaySmall: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 18,
        // fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.25),
    labelLarge: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25),
  ),
);
