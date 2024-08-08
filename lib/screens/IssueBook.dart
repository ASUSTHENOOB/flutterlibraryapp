import 'dart:convert';
import 'package:first_app/Models/borrowbook.dart';
import 'package:first_app/components/Search_bookfield.dart';
import 'package:first_app/screens/notify.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class IssueBook extends StatefulWidget {
  String regno;
  IssueBook({super.key, required this.regno});

  @override
  State<IssueBook> createState() => _IssueBookState();
}

class _IssueBookState extends State<IssueBook> {
  List<Borrowbook> borrowbook = [];
  List<Borrowbook> filteredborrowBooks = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchBookData();
    searchController.addListener(() {
      filterBooks();
    });
  }

  Future<void> fetchBookData() async {
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.0.106/libApi/borrow.php?reg_no=${widget.regno}'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          borrowbook = data.map((json) => Borrowbook.fromJson(json)).toList();
          filteredborrowBooks = borrowbook;
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load issue book data';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
        isLoading = false;
      });
    }
  }

  void filterBooks() {
    List<Borrowbook> _booksissue = [];
    _booksissue.addAll(borrowbook);
    if (searchController.text.isNotEmpty) {
      _booksissue.retainWhere((book) {
        String searchTerm = searchController.text.toLowerCase();
        String bookTitle = book.BookName.toLowerCase();
        String authorName = book.AuthorName.toLowerCase();
        String sessionNumber = book.SessionNumber.toString();
        return bookTitle.contains(searchTerm) ||
            authorName.contains(searchTerm) ||
            sessionNumber.contains(searchTerm);
      });
    }
    setState(() {
      filteredborrowBooks = _booksissue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Issued Book".toUpperCase(),
          style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headlineMedium),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NotificationPage(borrowBooks: borrowbook),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyTextField2(
                controller: searchController,
                obsecuretext: false,
                hintName: "Search By BookName, Author, Session No!",
              )),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : errorMessage.isNotEmpty
                    ? Center(child: Text(errorMessage))
                    : filteredborrowBooks.isEmpty
                        ? Center(child: Text('No issued books found'))
                        : ListView.builder(
                            itemCount: filteredborrowBooks.length,
                            itemBuilder: (context, index) {
                              var bookborrows = filteredborrowBooks[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                              255, 130, 128, 128),
                                          offset: Offset(0.0, 7.0), //(x,y)
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                                  child: ListTile(
                                    title: Text(
                                      bookborrows.BookName,
                                      style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .titleLarge),
                                    ),
                                    subtitle: Text(
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 95, 159, 129),
                                                letterSpacing: 1.25)),
                                        'AuthorName: ${bookborrows.AuthorName}\nSession Number:${bookborrows.SessionNumber} \nBorrow status:${bookborrows.status == 0 ? (" Returned") : (" Not Returned")} '),
                                    trailing: bookborrows.status == 0
                                        ? Icon(
                                            Icons.check,
                                            color: Theme.of(context)
                                                .primaryColorLight,
                                          )
                                        : Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                  ),
                                ),
                              );
                            },
                          ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
