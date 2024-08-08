import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:first_app/Models/borrowbook.dart';

class NotificationPage extends StatefulWidget {
  final List<Borrowbook> borrowBooks;

  NotificationPage({required this.borrowBooks});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late List<Borrowbook> _borrowBooks;

  @override
  void initState() {
    super.initState();
    _borrowBooks = widget.borrowBooks;
  }

  void _clearNotifications() {
    setState(() {
      _borrowBooks.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Notifications".toUpperCase(),
          style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headlineMedium),
        ),
      ),
      body: _borrowBooks.isEmpty
          ? Center(
              child: Text("No notifications right now!",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 43, 73, 65),
                          letterSpacing: 1.25))),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    onPressed: _clearNotifications,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context)
                          .primaryColorLight, // Background color
                      // Text color
                      elevation: 10, // Shadow elevation
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Button shape
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 25), // Button padding
                    ),
                    child: Text("Clear All Notifications",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                                letterSpacing: 1.25))),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _borrowBooks.length,
                    itemBuilder: (context, index) {
                      final book = _borrowBooks[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 130, 128, 128),
                                  offset: Offset(0.0, 7.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(context).colorScheme.onSurface),
                          child: ListTile(
                            title: Text(book.BookName,
                                style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .titleLarge)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Issued on: ${book.borrowDate.toLocal()}",
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 95, 159, 129),
                                            letterSpacing: 1.25))),
                                book.status == 0
                                    ? Text("Book was returned successfully!",
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 95, 159, 129),
                                                letterSpacing: 1.25)))
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Return by: ${book.returnDate.toLocal()}",
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 95, 159, 129),
                                                      letterSpacing: 1.25))),
                                          Text(
                                              "Days remaining: ${book.daysRemaining}",
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 95, 159, 129),
                                                      letterSpacing: 1.25))),
                                        ],
                                      ),
                              ],
                            ),
                            trailing: book.status == 0
                                ? Icon(
                                    Icons.check,
                                    color: Colors.green,
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
}
