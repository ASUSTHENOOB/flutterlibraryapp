import 'package:first_app/anims/text_anim.dart';
import 'package:first_app/components/custom_carousel.dart';
import 'package:first_app/components/drawer.dart';
import 'package:first_app/components/hometiles/hometile1.dart';
import 'package:first_app/components/hometiles/myhometile2.dart';
import 'package:first_app/components/hometiles/myhometile3.dart';
import 'package:first_app/screens/login_screen.dart';
import 'package:first_app/screens/notify.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  final String regno;
  final String sname;

  MainPage({super.key, required this.regno, required this.sname});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController search_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        drawer: MyDrawer(
          regno: widget.regno,
        ),
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NotificationPage(borrowBooks: [])));
                },
                icon: Icon(Icons.notifications),
              ),
            )
          ],
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.onSurface),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "UOC E-LIB",
            style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headlineMedium),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, top: 25),
                      child: Text(
                        'Hey ,',
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.titleLarge),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0, top: 22),
                      child: Text(
                        '${widget.sname}'
                            .toUpperCase(), //Used String Interpolation Means Running the current instance of the widget context
                        style: GoogleFonts.roboto(
                            textStyle:
                                Theme.of(context).textTheme.headlineSmall),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //       height: 10,
                //     ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, top: 25),
                      child: Text(
                        'With RegNo ,',
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.titleLarge),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0, top: 22),
                      child: Text(
                        '${widget.regno}',
                        style: GoogleFonts.roboto(
                            textStyle:
                                Theme.of(context).textTheme.headlineSmall),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  thickness: 0.25,
                  color: Colors.grey[400],
                ),
                Text("Welcome to UOC E-Lib",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 43, 73, 65),
                            letterSpacing: 1.25))),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: InkWell(
                    onTap: () {
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) => fplogic()));
                    },
                    child: Mycarousel(),
                  ),
                ),
                Divider(
                  thickness: 0.25,
                  color: Colors.grey[400],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 207, 204, 204),
                        ),
                        height: 60,
                        width: double.infinity,
                        child: Center(child: textanim()),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 200, top: 15),
                  child: Text("Library Services !",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 43, 73, 65),
                              letterSpacing: 1.25))),
                ),
                Divider(
                  thickness: 0.25,
                  color: Colors.grey[400],
                ),
                Container(
                  height: 240,
                  decoration: BoxDecoration(),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      myhometile1(),
                      myhometile2(regno: '${widget.regno}'),
                      myhometile3(regno: '${widget.regno}'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
