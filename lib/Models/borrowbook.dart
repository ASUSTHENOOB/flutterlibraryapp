class Borrowbook {
  final int id;
  final String date_borrow;
  final String ClassificationNo;
  final String SessionNumber;
  final String BookName;
  final String AuthorName;
  final String Year;
  final int status;

  Borrowbook({
    required this.id,
    required this.date_borrow,
    required this.ClassificationNo,
    required this.SessionNumber,
    required this.BookName,
    required this.AuthorName,
    required this.Year,
    required this.status,
  });

  factory Borrowbook.fromJson(Map<String, dynamic> json) {
    return Borrowbook(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      date_borrow: json['date_borrow'] as String,
      ClassificationNo: json['ClassificationNo'] as String,
      SessionNumber: json['SessionNumber'] as String,
      BookName: json['BookName'] as String,
      AuthorName: json['AuthorName'] as String,
      Year: json['Year'] as String,
      status: json['status'] is int
          ? json['status']
          : int.parse(json['status'].toString()),
    );
  }

  DateTime get borrowDate => DateTime.parse(date_borrow);
  DateTime get returnDate => borrowDate.add(Duration(days: 14));
  int get daysRemaining => returnDate.difference(DateTime.now()).inDays;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date_borrow': date_borrow,
      'ClassificationNo': ClassificationNo,
      'SessionNumber': SessionNumber,
      'BookName': BookName,
      'AuthorName': AuthorName,
      'Year': Year,
      'status': status,
    };
  }
}
