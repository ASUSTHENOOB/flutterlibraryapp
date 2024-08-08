import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:first_app/utils/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
void initState()  {
    super.initState();
    _navigateToNext();
   
  }

  Future<void> _navigateToNext() async {
    await Future.delayed(Duration(seconds: 3), () {}); // Show splash for 3 seconds
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      String regno = prefs.getString('regno') ?? '';
      String sname = prefs.getString('name') ?? '';
      Navigator.pushReplacementNamed(
        context,
        RouteName.mainpage,
        arguments: {'regno': regno, 'name': sname},
      );
    } else {
      Navigator.pushReplacementNamed(context, RouteName.onboardpage);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topRight, colors: [
          Color.fromARGB(255, 43, 73, 65),
          Color.fromARGB(255, 95, 159, 129)
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'images/logo.png',
              height: 200,
              width: 200,
            )),
            SizedBox(height: 30),
            SizedBox(
              height: 30,
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  FlickerAnimatedText('UOC E-LIB',
                      textStyle: Theme.of(context).textTheme.displaySmall)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
