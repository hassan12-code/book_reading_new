import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:book_reading/widgets/home_widget/book_cover.dart';
import 'package:book_reading/widgets/home_widget/rating.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BestOfTheDay extends StatelessWidget {
  BestOfTheDay({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: screenHeight(context) * 0.3,
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
                SizedBox(
                  width: screenWidth(context) * 0.5,
                  child: Text(
                    book.title,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                    ),
                  ),
                ),
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
          Positioned(
            right: 20,
            top: -20,
            child: BookCover(
              key: Key("123456"),
              bookCover: book.bookCover,
              height: 150,
              width: 150,
            ),
          ),
        ],
      ),
    );
  }

  List<String> messages = [];
}
