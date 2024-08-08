class Book {
  String title;
  String author;
  String session;
  bool isFavorite;

  Book({
    required this.title,
    required this.author,
    required this.session,
    this.isFavorite = false,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['BookName'],
      author: json['AuthorName'],
      session: json['SessionNumber'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'BookName': title,
      'AuthorName': author,
      'SessionNumber': session,
      'isFavorite': isFavorite,
    };
  }
}
