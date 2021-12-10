import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:book_reading/widgets/book_view_widgets/book_details.dart';
import 'package:book_reading/widgets/book_view_widgets/color_overlay.dart';
import 'package:book_reading/widgets/home_widget/book_cover.dart';
import 'package:book_reading/widgets/home_widget/rating.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookView extends StatelessWidget {
  const BookView({Key? key}) : super(key: key);

  static const String routeName = '/book_view';

  @override
  Widget build(BuildContext context) {
    final Book book = ModalRoute.of(context)!.settings.arguments as Book;
    return Scaffold(
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            child: BookCover(
              bookCover: book.bookCover,
              height: screenHeight(context) * 0.45,
              width: screenWidth(context),
              fit: BoxFit.cover,
            ),
          ),
          ColorOverlay(),
          Column(
            children: [
              BookDetails(book: book),
              Container(
                height: screenHeight(context) * 0.4,
                child: ListView.builder(
                  itemCount: book.chapters.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final chapter = book.chapters[index];
                    return ChapterTile(chapter: chapter);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ChapterTile extends StatelessWidget {
  const ChapterTile({
    Key? key,
    required this.chapter,
  }) : super(key: key);

  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        shadowColor: Colors.black54,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Chapter ${chapter.chapterNo} : ${chapter.title}",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    chapter.description,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.chevron_right,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
