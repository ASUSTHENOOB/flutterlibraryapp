import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mybutton extends StatelessWidget {
  final String text;
  final void Function()? ontap;
  const Mybutton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 65),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 130, 128, 128),
              offset: Offset(0.0, 9.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(text,
              style: GoogleFonts.roboto(
                  // ignore: deprecated_member_use
                  textStyle: Theme.of(context).textTheme.labelLarge)),
        ),
      ),
    );
  }
}
