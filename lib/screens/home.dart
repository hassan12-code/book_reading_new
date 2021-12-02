import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:book_reading/widgets/home_widget/book_cover.dart';
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
                flex: 3,
                child: ReadingSection(books: user.books),
              ),
              Expanded(
                  flex: 2,
                  child: BestOfTheDay(book: getBestOfTheDayBook(user.books))),
              Expanded(
                flex: 1,
                child: Container(),
              )
            ],
          ),
        ],
      ),
    );
  }

  Book getBestOfTheDayBook(List<Book> books) {
    List<Book> booksToSort = books.map((e) => e).toList();
    booksToSort.sort((a, b) => b.rating.compareTo(a.rating));

    return booksToSort.first;
  }
}

class BestOfTheDay extends StatelessWidget {
  const BestOfTheDay({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30),
            width: screenWidth(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Color(0xFFEAEAEA),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book.title,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                    )),
                Text(book.author),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Rating(
                        rating: book.rating,
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: screenWidth(context) * 0.5,
                        child: Text(
                          book.details,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BookCover(
            bookCover: book.bookCover,
            height: 150,
            width: 150,
          ),
        ],
      ),
    );
  }
}
