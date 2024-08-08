import 'package:first_app/screens/IssueBook.dart';
import 'package:first_app/screens/ReturnsBook.dart';
import 'package:first_app/utils/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class myhometile3 extends StatefulWidget {
  String regno;
  myhometile3({super.key, required this.regno});

  @override
  State<myhometile3> createState() => _myhometile3State();
}

class _myhometile3State extends State<myhometile3> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Returnsbook(regno: '${widget.regno}')));
      },
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(" See Returned List..",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 43, 73, 65),
                          letterSpacing: 1.25))),
            ),
            Text("Returned Section...",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 43, 73, 65),
                        letterSpacing: 1.25))),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      height: 100,
                      'images/file.png',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 90),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Color.fromARGB(255, 43, 73, 65),
                  ),
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 130, 128, 128),
              offset: Offset(0.0, 8.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 95, 159, 129),
        ),
        margin: EdgeInsets.all(10),
        width: 260,
      ),
    );
  }
}
