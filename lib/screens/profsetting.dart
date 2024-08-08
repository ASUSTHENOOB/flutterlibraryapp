import 'package:first_app/components/list_tile.dart';
import 'package:first_app/screens/editprofile.dart';
import 'package:first_app/screens/help_centre.dart';
import 'package:first_app/screens/home_Page.dart';
import 'package:first_app/screens/recent_activity.dart';
import 'package:first_app/screens/terms_conditions.dart';
import 'package:first_app/utils/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class profsettings extends StatefulWidget {
  final String accname;
  final String accemail;

  const profsettings({
    super.key,
    required this.accemail,
    required this.accname,
  });

  @override
  State<profsettings> createState() => _profsettingsState();
}

class _profsettingsState extends State<profsettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onSurface),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "profile".toUpperCase(),
          style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headlineMedium),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Container(
            child: Column(
              children: [
                Stack(children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                    child: Container(
                                  width: 300,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    image: DecorationImage(
                                      image: AssetImage('images/avatar1.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )));
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset('images/avatar1.jpg')),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => editprofile()));
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).primaryColor),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ]),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.accname,
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 95, 159, 129),
                          letterSpacing: 1.25)),
                ),
                Text(
                  widget.accemail,
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 95, 159, 129),
                          letterSpacing: 1.25)),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 150,
                    child: MyButton(
                      text: 'Edit Profile',
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => editprofile()));
                      },
                    )),
                SizedBox(height: 30),
                Divider(
                  thickness: 0.25,
                  color: Colors.grey[400],
                ),
                Mytile(
                    Leading: Icons.settings,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActivityPage()));
                    },
                    Title: "Settings",
                    Trailing: Icons.arrow_right),
                Mytile(
                    Leading: Icons.notifications,
                    ontap: () {},
                    Title: "Notifications",
                    Trailing: Icons.arrow_right),
                Mytile(
                    Leading: Icons.help_center,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HelpCentre()));
                    },
                    Title: "Help Centre ?",
                    Trailing: Icons.arrow_right),
                Mytile(
                    Leading: Icons.document_scanner,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TermsAndConditionsPage()));
                    },
                    Title: "Terms And Conditions",
                    Trailing: Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
