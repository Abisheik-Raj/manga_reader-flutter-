class Book {
  Book({
    required this.id,
    required this.title,
    required this.contentRating,
    required this.publicDemographic,
    required this.imageUrl,
    required this.currentChapter,
    required this.totalChapters,
  });

  String id;
  String title;
  String contentRating;
  String publicDemographic;
  String imageUrl;
  int currentChapter;
  int totalChapters;

  Map<dynamic, dynamic> toJson(Book book) {
    return {
      "id": id,
      "title": title,
      "contentRating": contentRating,
      "publicDemographic": publicDemographic,
      "imageUrl": imageUrl,
      "currentChapter": currentChapter,
      "totalChapters": totalChapters,
    };
  }
}
