import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:first_app/screens/login_screen.dart';
import 'package:first_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.onSurface
            //     gradient: LinearGradient(begin: Alignment.topRight, colors: [
            //   Color.fromARGB(255, 43, 73, 65),
            //   Color.fromARGB(255, 95, 159, 129)
            // ])
            ),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Center(
              child: Container(
                child: Image.asset(
                  'images/logo.png',
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            Container(
              height: 400,
              width: 300,
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TypewriterAnimatedText(
                      speed: Duration(milliseconds: 10),
                      textStyle: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.titleLarge),
                      textAlign: TextAlign.justify,
                      'Library and Central Library of University of Chakwal plays a vital role in the academic life of a university. The fundamental role of the libraries is educational. It should not be operated as a mere storehouse of books, rather it should be a dynamic instrument of education. The Library and Central Library of the university is being organized on these lines.The library and central library collections support not only every course in the curriculum but also include selected stock of general reference books, periodicals, publications, newspapers etc. Most of the departments have their own departmental libraries situated in their own buildings. The administration of the Libraries are vested in the Library Committee.'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      text: "SignUp",
                      onpress: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    MyButton(
                      text: "Login",
                      onpress: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onpress;
  const MyButton({super.key, required this.text, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 40,
        width: 130,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 130, 128, 128),
                offset: Offset(0.0, 7.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.circular(20.0),
            color: Theme.of(context).primaryColor),
        child: Center(
            child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.labelLarge),
        )),
      ),
    );
  }
}
