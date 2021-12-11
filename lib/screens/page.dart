import 'dart:convert';

import 'package:book_reading/models/BookmarkPoint.dart';
import 'package:book_reading/models/last_point.dart';
import 'package:book_reading/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageReading extends StatefulWidget {
  PageReading({Key? key}) : super(key: key);

  static const String routeName = '/page';

  @override
  State<PageReading> createState() => _PageReadingState();
}

class _PageReadingState extends State<PageReading> {
  int currentPage = 1;
  int bookmarkedPage = 1;
  Color iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final PageReadingArguments args =
        ModalRoute.of(context)!.settings.arguments as PageReadingArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.chapter.title),
        centerTitle: true,
        backgroundColor: Colors.black,
         actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                bookmarkedPage = currentPage; // stores current page number on button press
                print(Text("Bookmarked pageNo = : $bookmarkedPage"),);
                iconColor = Colors.amber;
              });
              setBookmark(
                bookTitle: args.book.title,
                chapterNo: args.chapter.chapterNo,
                bookmarkPage: bookmarkedPage,
              ); 
            },
            icon: Icon(Icons.star,color: iconColor,),
          ),
        ],
      ),
      body: Center(
          child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                  onPageChanged: (int index) {
                    setState(() {
                      currentPage = index + 1;
                    });
                    setLastLeftOffPoint(
                        pageNo: currentPage,
                        chapterNo: args.chapter.chapterNo,
                        bookAuthor: args.book.author,
                        bookTitle: args.book.title,
                        totalChapters: args.book.chapters.length);
                  },
                  children: args.chapter.pages
                      .map((page) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              args.chapter.pages[0],
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                fontSize: 21,
                                letterSpacing: 1,
                                wordSpacing: 1,
                              ),
                            ),
                          ))
                      .toList()),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text('$currentPage/${args.chapter.pages.length}',
                  style: GoogleFonts.poppins(fontSize: 21)),
            ),
          ],
        ),
      )),
    );
  }

  void setLastLeftOffPoint(
      {required String bookTitle,
      required String bookAuthor,
      required int chapterNo,
      required int totalChapters,
      required int pageNo}) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    final lastPoint = LastPoint(
        bookTitle: bookTitle,
        bookAuthor: bookAuthor,
        chapterNo: chapterNo,
        totalChapters: totalChapters,
        pageNo: pageNo);

    _pref.setString("lastPoint", jsonEncode(lastPoint.toJson()));
  }
  // Bookmark function
  void setBookmark(
  {
    required String bookTitle,
    required int chapterNo,
    required int bookmarkPage, 
  }) async{
    SharedPreferences _pr = await SharedPreferences.getInstance();
    final bookmarkPoint = BookmarkPoint(
      bookTitle: bookTitle,
      chapterNo: chapterNo,
      bookmarkPage: bookmarkPage,
    );

    _pr.setString("bookmarkPoint", jsonEncode(bookmarkPoint.toJSON()));
  }

}

class PageReadingArguments {
  final Chapter chapter;
  final Book book;

  PageReadingArguments({required this.chapter, required this.book});
}
