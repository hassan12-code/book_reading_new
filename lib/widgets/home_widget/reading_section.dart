import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:book_reading/widgets/home_widget/book_cover.dart';
import 'package:book_reading/widgets/home_widget/book_information.dart';
import 'package:flutter/material.dart';

class ReadingSection extends StatefulWidget {
  ReadingSection({
    Key? key,
    required this.books,
  }) : super(key: key);

  final List<Book> books;

  @override
  State<ReadingSection> createState() => _ReadingSectionState();
}

class _ReadingSectionState extends State<ReadingSection> {
  bool isShowingCover = true;

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
            children: widget.books.map((book) {
              return Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      BookInformation(
                        book: book,
                        onShowingDetails: (bool isShowingDetails) {
                          print("I AM RUNNING HERE");
                          setState(() {
                            isShowingCover = !isShowingDetails;
                          });
                        },
                      ),
                      isShowingCover == true
                          ? BookCover(bookCover: book.bookCover)
                          : SizedBox(),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
