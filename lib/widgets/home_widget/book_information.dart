import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:flutter/material.dart';

class BookInformation extends StatelessWidget {
  const BookInformation({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight(context) * 0.28,
        width: screenWidth(context) * 0.45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black26,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(book.rating.toString()),
                  Icon(
                    Icons.star_outlined,
                    color: Colors.yellow,
                  ),
                ],
              ),
              Text(book.title),
              Text(book.author),
            ],
          ),
        ));
  }
}
