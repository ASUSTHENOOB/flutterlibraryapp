import 'dart:convert';

import 'package:first_app/Models/returnbook.dart';
import 'package:first_app/components/Search_bookfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Returnsbook extends StatefulWidget {
  String regno;
  Returnsbook({super.key, required this.regno});

  @override
  State<Returnsbook> createState() => _ReturnsbookState();
}

class _ReturnsbookState extends State<Returnsbook> {
  List<Returnbook> returnbook = [];
  List<Returnbook> filteredreturnBooks = [];
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
          'http://192.168.0.106/libApi/return.php?reg_no=${widget.regno}'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          returnbook = data.map((json) => Returnbook.fromJson(json)).toList();
          filteredreturnBooks = returnbook;
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load returns book data';
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
    List<Returnbook> _booksreturn = [];
    _booksreturn.addAll(returnbook);
    if (searchController.text.isNotEmpty) {
      _booksreturn.retainWhere((book) {
        String searchTerm = searchController.text.toLowerCase();
        String bookTitle = book.BookName.toLowerCase();
        String authorName = book.AuthorName.toLowerCase();
        String date = book.date_return.toString();
        String session = book.SessionNumber.toString();
        return bookTitle.contains(searchTerm) ||
            authorName.contains(searchTerm) ||
            date.contains(searchTerm) ||
            session.contains(searchTerm);
      });
    }
    setState(() {
      filteredreturnBooks = _booksreturn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Returned Book".toUpperCase(),
          style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headlineMedium),
        ),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyTextField2(
                controller: searchController,
                obsecuretext: false,
                hintName: "Search By  BookName, Author , Date !",
              )),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : errorMessage.isNotEmpty
                    ? Center(child: Text(errorMessage))
                    : filteredreturnBooks.isEmpty
                        ? Center(child: Text('No Return books found'))
                        : ListView.builder(
                            itemCount: filteredreturnBooks.length,
                            itemBuilder: (context, index) {
                              var bookborrows = filteredreturnBooks[index];
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
                                        'AuthorName: ${bookborrows.AuthorName}\nSession No: ${bookborrows.SessionNumber}',
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 95, 159, 129),
                                                letterSpacing: 1.25))),
                                    trailing: Text(
                                        "Returned On: \n${bookborrows.date_return}",
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                letterSpacing: 1.25))),
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
