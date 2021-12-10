class LastPoint {
  String bookTitle;
  String bookAuthor;
  int chapterNo;
  int totalChapters;
  int pageNo;

  LastPoint({
    required this.bookTitle,
    required this.bookAuthor,
    required this.chapterNo,
    required this.totalChapters,
    required this.pageNo,
  });

  Map<String, dynamic> toJson() => {
        "bookTitle": this.bookTitle,
        "bookAuthor": this.bookAuthor,
        "chapterNo": this.chapterNo,
        "totalChapters": this.totalChapters,
        "pageNo": this.pageNo,
      };
}
