import "package:animated_text_kit/animated_text_kit.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class HelpCentre extends StatelessWidget {
  const HelpCentre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.onSurface),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Help Center".toUpperCase(),
            style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headlineMedium),
          )),
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 250.0),
          child: Column(
            children: [
              Container(
                height: 100,
                width: 220,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 130, 128, 128),
                        offset: Offset(0.0, 10.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20.0),
                    color: Theme.of(context).primaryColor),
                child: Center(
                    child: Text(
                  "ANY QUESTION ?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.labelLarge),
                )),
              ),
              Divider(
                thickness: 0.25,
                color: Colors.grey[400],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText(
                        "For any inquiries, please visit the University of Chakwal or contact us at +923231131330 or via email at faculty@uoc.edu.pk.",
                        textStyle: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 43, 73, 65),
                                letterSpacing: 1.25))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
