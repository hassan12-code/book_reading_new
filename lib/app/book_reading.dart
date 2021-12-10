import 'package:book_reading/screens/book_view.dart';
import 'package:book_reading/screens/home.dart';
import 'package:book_reading/screens/page.dart';
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
        Home.routeName: (context) {
          return Home();
        },
        BookView.routeName: (context) {
          return BookView();
        },
        PageReading.routeName: (context) {
          return PageReading();
        }
      },
    );
  }
}
