class Returnbook {
final int id;
final String date_return;
final String ClassificationNo;

final String SessionNumber;
final String BookName;
final String AuthorName;
final String Year;
final int status;


Returnbook ({

  required this.id,
  required this.date_return,
  required this.ClassificationNo,
  required this.SessionNumber,
  required this.BookName,
  required this.AuthorName,
  required this.Year,
  required this.status


});



 factory Returnbook.fromJson(Map<String, dynamic> json) {
    return Returnbook(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      date_return: json['date_return'] as String,
      ClassificationNo: json['ClassificationNo'] as String,
      SessionNumber: json['SessionNumber'] as String,
      BookName: json['BookName'] as String,
      AuthorName: json['AuthorName'] as String,
      Year: json['Year'] as String,
      status: json['status'] is int ? json['status'] : int.parse(json['status'].toString()),
    
    );
  }

  // Method to convert a Book object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date_return': date_return,
      'ClassificationNo':ClassificationNo,
       'SessionNumber':SessionNumber,
       'BookName':BookName,
       'AuthorName':AuthorName,
       'Year':Year,
       'status':status
      
   
    };
  }
}
