import 'package:book_reading/screens/home.dart';
import 'package:book_reading/screens/splash.dart';
import 'package:flutter/material.dart';

class BookReading extends StatelessWidget {
  BookReading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) {
          return Splash();
        },
        "/home": (context) {
          return Home();
        },
      },
    );
  }
}
