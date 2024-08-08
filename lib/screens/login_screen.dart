import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:first_app/components/textfields.dart';
import 'package:first_app/backups/forgot_password.dart';
import 'package:first_app/screens/main_content.dart';
import 'package:first_app/utils/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<void> loginUser() async {
    final url = 'http://192.168.0.106/libApi/login.php';
    final response = await http.post(Uri.parse(url), body: {
      'email': emailController.text,
      'password': passController.text,
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (data['status'] == "success") {
        print('Login successful: ${response.body}');
        String apiname = data['name'];
        String apiregno = data['regno'];

        // Save login in shared preference
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('name', apiname);
        await prefs.setString('regno', apiregno);
        await prefs.setBool('isLoggedIn', true);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainPage(
                      regno: apiregno,
                      sname: apiname,
                    )));
      } else {
        print('Login fail: ${response.body}');
        Toast.show(
          "❌❌ Invalid Email Or Pass ❌❌",
          textStyle: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                  letterSpacing: 1.25)),
          backgroundColor: Theme.of(context).primaryColor,
        );
      }
    } else {
      print('Error ${response.statusCode}: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    void fpnavigate() {
      Navigator.pushNamed(context, RouteName.forgotpass);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 80,
                  width: 70,
                ),
                SizedBox(height: 15),
                Column(
                  children: [
                    Text("Student",
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.titleLarge)),
                    Text("LOGIN",
                        style: GoogleFonts.roboto(
                            textStyle:
                                Theme.of(context).textTheme.headlineSmall)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Welcome back you\'ve been missed!',
                style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.titleLarge)),
            SizedBox(height: 50),
            MyTextField(
              obsecuretext: false,
              hintName: "Email",
              controller: emailController,
            ),
            MyTextField(
              hintName: "Password",
              obsecuretext: true,
              controller: passController,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordPage()));
                    },
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.titleLarge),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                if (emailController.text.isEmpty ||
                    passController.text.isEmpty) {
                  Toast.show(
                    "Email and Password cannot be empty!!",
                    textStyle: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                            letterSpacing: 1.25)),
                    backgroundColor: Theme.of(context).primaryColor,
                  );
                } else {
                  loginUser();
                }
              },
              child: Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 65),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 130, 128, 128),
                      offset: Offset(0.0, 9.0),
                      blurRadius: 6.0,
                    ),
                  ],
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("LOGIN",
                      style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.labelLarge)),
                ),
              ),
            ),
            SizedBox(height: 30),
            Divider(
              thickness: 0.6,
              color: Colors.grey[400],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.signup);
                  },
                  child: Text('REGISTER NOW!',
                      style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.titleLarge)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
