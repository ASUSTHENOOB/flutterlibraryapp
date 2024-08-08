import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class textanim extends StatefulWidget {
  const textanim({super.key});

  @override
  State<textanim> createState() => _textanimState();
}

class _textanimState extends State<textanim> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        FadeAnimatedText(
            duration: Duration(milliseconds: 3000),
            "Libraries are the heart of communities.",
            textStyle: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 43, 73, 65),
                    letterSpacing: 1.25))),
        FadeAnimatedText(
            duration: Duration(milliseconds: 3000),
            '"Today a reader, tomorrow a leader." – Margaret Fuller',
            textStyle: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 43, 73, 65),
                    letterSpacing: 1.25))),
        FadeAnimatedText(
            duration: Duration(milliseconds: 3000),
            '"The best way to predict the future is to invent it."',
            textStyle: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 43, 73, 65),
                    letterSpacing: 1.25))),
        FadeAnimatedText(
            duration: Duration(milliseconds: 3000),
            "Reading is a  ticket to everywhere --Mary Schmich",
            textStyle: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 43, 73, 65),
                    letterSpacing: 1.25))),
        FadeAnimatedText(
            duration: Duration(milliseconds: 3000),
            "There is no loyal as a book. - Ernest Hemingway",
            textStyle: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 43, 73, 65),
                    letterSpacing: 1.25))),
      ],
    );
  }
}
