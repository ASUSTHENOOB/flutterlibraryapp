import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditionsPage extends StatelessWidget {
  String Name = 'CS 2K20 (TALHA,UMAIR,DAUD)';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.onSurface),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Terms And Conditions".toUpperCase(),
            style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headlineMedium),
          )),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Introduction',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 43, 73, 65),
                        letterSpacing: 1.25))),
            SizedBox(height: 8.0),
            Text.rich(
              TextSpan(
                text: 'The E_LIB UOC is developed by ',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 95, 159, 129),
                        letterSpacing: 1.25)),
                children: [
                  TextSpan(
                    text: Name,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 43, 73, 65),
                            letterSpacing:
                                1.25)), // Add your desired styles here
                  ),
                  TextSpan(
                      text:
                          '  By accessing or using our application, you agree to be bound by these terms and conditions. If you do not agree with any part of the terms, you may not use the application.',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 95, 159, 129),
                              letterSpacing: 1.25))),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Divider(
              thickness: 0.25,
              color: Colors.grey[400],
            ),
            Text('Use of the Application',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 43, 73, 65),
                        letterSpacing: 1.25))),
            SizedBox(height: 8.0),
            Text(
                'You must be a registered student or staff member of UOC to use this application. You agree to use the application only for lawful purposes and in a way that does not infringe the rights of, restrict, or inhibit anyone else\'s use and enjoyment of the application. You must not misuse the application by knowingly introducing viruses, trojans, worms, or other material that is malicious or technologically harmful.',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 95, 159, 129),
                        letterSpacing: 1.25))),
            SizedBox(height: 16.0),
            Divider(
              thickness: 0.25,
              color: Colors.grey[400],
            ),
            Text('Accounts',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 43, 73, 65),
                        letterSpacing: 1.25))),
            SizedBox(height: 8.0),
            Text(
                'To access certain features of the application, you may be required to create an account. You agree to provide accurate, current, and complete information during the registration process. You are responsible for safeguarding the password that you use to access the application and for any activities or actions under your password. You agree to notify us immediately of any unauthorized use of your account or any other breach of security.',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 95, 159, 129),
                        letterSpacing: 1.25))),
            SizedBox(height: 16.0),
            Divider(
              thickness: 0.25,
              color: Colors.grey[400],
            ),
            Text('User Content',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 43, 73, 65),
                        letterSpacing: 1.25))),
            SizedBox(height: 8.0),
            Text(
                'You are solely responsible for any content that you upload, post, or otherwise make available through the application. You grant us a non-exclusive, transferable, sub-licensable, royalty-free, worldwide license to use, copy, modify, create derivative works based upon, and distribute your user content in connection with operating and providing the application.',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 95, 159, 129),
                        letterSpacing: 1.25))),
            SizedBox(height: 16.0),
            Divider(
              thickness: 0.25,
              color: Colors.grey[400],
            ),
            Text('Intellectual Property',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 43, 73, 65),
                        letterSpacing: 1.25))),
            SizedBox(height: 8.0),
            Text(
                'The application and its original content, features, and functionality are and will remain the exclusive property of UOC and its licensors. You must not use any part of the content on the application for commercial purposes without obtaining a license to do so from us or our licensors.',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 95, 159, 129),
                        letterSpacing: 1.25))),
            SizedBox(height: 16.0),
            Divider(
              thickness: 0.25,
              color: Colors.grey[400],
            ),
            Text('Privacy',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 43, 73, 65),
                        letterSpacing: 1.25))),
            SizedBox(height: 8.0),
            Text(
                'Your use of the application is also governed by our Privacy Policy, which explains how we collect, use, and share your information.',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 95, 159, 129),
                        letterSpacing: 1.25))),
            SizedBox(height: 16.0),
            Divider(
              thickness: 0.25,
              color: Colors.grey[400],
            ),
            Text('Termination',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 43, 73, 65),
                        letterSpacing: 1.25))),
            SizedBox(height: 8.0),
            Text(
                'We may terminate or suspend your access to the application immediately, without prior notice or liability, for any reason, including without limitation if you breach the terms. Upon termination, your right to use the application will immediately cease. If you wish to terminate your account, you may simply discontinue using the application.',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 95, 159, 129),
                        letterSpacing: 1.25))),
            SizedBox(height: 16.0),
            Divider(
              thickness: 0.25,
              color: Colors.grey[400],
            ),
            Text('Limitation of Liability',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 43, 73, 65),
                        letterSpacing: 1.25))),
            SizedBox(height: 8.0),
            Text(
                'To the maximum extent permitted by applicable law, in no event shall UOC be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, or any loss of data, use, goodwill, or other intangible losses, resulting from your use or inability to use the application.',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 95, 159, 129),
                        letterSpacing: 1.25))),
            SizedBox(height: 16.0),
            Divider(
              thickness: 0.25,
              color: Colors.grey[400],
            ),
            Text('Changes to the Terms',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 43, 73, 65),
                        letterSpacing: 1.25))),
            SizedBox(height: 8.0),
            Text(
                'We reserve the right to modify or replace these terms at any time. If a revision is material, we will provide at least 30 days\' notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 95, 159, 129),
                        letterSpacing: 1.25))),
            SizedBox(height: 16.0),
            Divider(
              thickness: 0.25,
              color: Colors.grey[400],
            ),
            Text('Governing Law',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 43, 73, 65),
                        letterSpacing: 1.25))),
            SizedBox(height: 8.0),
            Text(
                'These terms shall be governed and construed in accordance with the laws of Pakistan, without regard to its conflict of law provisions.',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 95, 159, 129),
                        letterSpacing: 1.25))),
            SizedBox(height: 16.0),
            Divider(
              thickness: 0.25,
              color: Colors.grey[400],
            ),
            Text('Contact Us',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 43, 73, 65),
                        letterSpacing: 1.25))),
            SizedBox(height: 8.0),
            Text(
                'If you have any queries about these terms, please contact us at [ faculty@uoc.edu.pk OR 03328463983].',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 95, 159, 129),
                        letterSpacing: 1.25))),
          ],
        ),
      ),
    );
  }
}
