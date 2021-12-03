import 'package:book_reading/models/user.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({
    Key? key,
    required this.bookCover,
    this.height = 70,
    this.width = 70,
  }) : super(key: key);

  final String bookCover;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(bookCover),
      height: height,
      width: width,
    );
  }
}
