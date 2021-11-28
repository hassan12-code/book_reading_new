import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:book_reading/widgets/home_widget/book_cover.dart';
import 'package:book_reading/widgets/home_widget/book_information.dart';
import 'package:flutter/material.dart';

class ReadingSection extends StatelessWidget {
  const ReadingSection({
    Key? key,
    required this.books,
  }) : super(key: key);

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "What are you\nReading Today?",
            style: TextStyle(fontSize: 25),
          ),
        ),
        Expanded(
          child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 25),
              scrollDirection: Axis.horizontal,
              children: books.map((book) {
                return Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        BookInformation(book: book),
                        BookCover(bookCover: book.bookCover),
                      ],
                    ),
                  ),
                );
              }).toList()
              //  [
              //
              // ],
              ),
        )
      ],
    );
  }
}
