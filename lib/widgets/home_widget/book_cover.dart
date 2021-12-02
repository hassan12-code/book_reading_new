import 'package:book_reading/models/user.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({
    Key? key,
    required this.bookCover,
    this.height,
    this.width,
  }) : super(key: key);

  final String bookCover;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -20,
      left: 25,
      child: Image(
        image: NetworkImage(bookCover),
        height: height ?? 70,
        width: width ?? 70,
      ),
    );
  }
}
