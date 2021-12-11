import 'package:flutter/cupertino.dart';

class BookmarkPoint{
    String bookTitle;
    int chapterNo;
    int bookmarkPage;

  BookmarkPoint(
    {
      required this.bookTitle,
      required this.chapterNo,
      required this.bookmarkPage,
    }
    );

    Map<String,dynamic> toJSON () =>
    {
          "bookTitle" : bookTitle,
          "chapterNo" : chapterNo,
          "bookmarkPage" : bookmarkPage,
    };
}