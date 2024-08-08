// ignore_for_file: deprecated_member_use
import 'package:first_app/screens/main_content.dart';
import 'package:first_app/screens/onboarding_screen.dart';
import 'package:first_app/screens/splash_screen.dart';
import 'package:first_app/themes/light_mode.dart';
import 'package:first_app/utils/routes.dart';
import 'package:first_app/utils/routes_name.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialRoute: RouteName.splashscreen,
      onGenerateRoute: Routes.generateRoute,
      routes: {
        RouteName.onboardpage: (context) => OnBoarding(),
        RouteName.mainpage: (context) => MainPage(
              regno: ModalRoute.of(context)!.settings.arguments != null
                  ? (ModalRoute.of(context)!.settings.arguments as Map)['regno']
                  : '',
              sname: ModalRoute.of(context)!.settings.arguments != null
                  ? (ModalRoute.of(context)!.settings.arguments as Map)['name']
                  : '',
            ),
      },
      theme: lightMode,
    );
  }
}
