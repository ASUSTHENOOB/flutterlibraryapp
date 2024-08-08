import 'package:first_app/components/button.dart';
import 'package:first_app/components/textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';

class fplogic extends StatefulWidget {
  const fplogic({super.key});

  @override
  State<fplogic> createState() => _fplogicState();
}

class _fplogicState extends State<fplogic> {
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.lock_outline,
            size: 120,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(height: 35),
          Text(
            'Forgot Password🙄',
            style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headlineSmall),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              'Provide your email and get your recent Password...',
              style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.titleLarge),
            ),
          ),
          SizedBox(height: 16),
          MyTextField(
              hintName: "example123@students.uoc.edu.pk",
              controller: emailcontroller,
              obsecuretext: false),
          SizedBox(height: 16),
          Mybutton(
              text: "Reset Password",
              ontap: () {
                // if (data = found)

                Toast.show("Toast plugin app",
                    duration: Toast.lengthShort, gravity: Toast.bottom);

                // else {
                //   print("mail not found");
                //   ;
                // }
              }),
        ],
      ),
    );
  }
}
