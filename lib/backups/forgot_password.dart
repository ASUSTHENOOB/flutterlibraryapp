import 'dart:convert';
import 'package:first_app/backups/reset_password.dart';
import 'package:first_app/components/button.dart';
import 'package:first_app/components/textfields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> _sendResetEmail() async {
    final response = await http.post(
      Uri.parse('http://192.168.100.65/weblib/libApi/forgot_password.php'),
      body: {'email': _emailController.text},
    );

    final responseData = json.decode(response.body);

    if (responseData['status'] == 'success') {
      // Navigate to the Reset Password page with the token
      String token = responseData[
          'token']; // Assuming the token is returned in the response
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResetPasswordPage(token: token),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responseData['message'])),
      );
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(responseData['message'])),
    );
  }

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
              controller: _emailController,
              obsecuretext: false),
          SizedBox(height: 16),
          Mybutton(text: "Reset Password", ontap: _sendResetEmail),
        ],
      ),
    );
  }
}
