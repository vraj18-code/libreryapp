import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'mainscreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff424242)),
        ),
      ),
      primarySwatch: Colors.blue,
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.deepPurpleAccent),
        headline2: TextStyle(color: Colors.deepPurpleAccent),
        bodyText2: TextStyle(color: Color(0xff424242)),
        subtitle1: TextStyle(color: Colors.deepPurpleAccent),
      ),
    ),
    debugShowCheckedModeBanner: false,
    home: AnimatedSplashScreen(
      splash: "images/yalee.png",
      splashIconSize: 200,
      nextScreen: MainScreen(),
      splashTransition: SplashTransition.fadeTransition,
    ),
  ));
}
