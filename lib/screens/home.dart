import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:book_reading/widgets/home_widget/book_cover.dart';
import 'package:book_reading/widgets/home_widget/book_of_the_day.dart';
import 'package:book_reading/widgets/home_widget/circle_notch.dart';
import 'package:book_reading/widgets/home_widget/rating.dart';
import 'package:book_reading/widgets/home_widget/reading_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                ReadingSection(
                  books: user.books,
                ),
                BestOfTheDay(book: getBestOfTheDayBook(user.books)),
                //TODO: Create Continue Reading Widget
                Container(
                  height: 150,
                  width: screenWidth(context),
                  color: Colors.red,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Book getBestOfTheDayBook(List<Book> books) {
    List<Book> booksToSort = books.map((e) => e).toList();
    booksToSort.sort((a, b) => b.rating.compareTo(a.rating));

    return booksToSort.first;
  }
}
