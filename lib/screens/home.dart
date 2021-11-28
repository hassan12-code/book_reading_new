import 'package:book_reading/models/user.dart';
import 'package:book_reading/widgets/home_widget/circle_notch.dart';
import 'package:book_reading/widgets/home_widget/reading_section.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      body: Stack(
        children: [
          CircleNotch(),
          Align(
            alignment: Alignment(2.5, -1.4),
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFE8BEB5),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              Expanded(
                child: ReadingSection(books: user.books),
              ),
              Expanded(child: Container(color: Colors.green))
            ],
          ),
        ],
      ),
    );
  }
}
