import 'package:book_reading/models/user.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({
    Key? key,
    required this.bookCover,
  }) : super(key: key);

  final String bookCover;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -20,
      left: 25,
      child: Image(
        image: NetworkImage(bookCover),
        height: 80,
        width: 70,
      ),
    );
  }
}
