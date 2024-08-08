import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:first_app/Models/book.dart'; // Ensure this path is correct

class FavoritesPage extends StatefulWidget {
  final Function(Book)? onUnfavorite;

  const FavoritesPage({required this.onUnfavorite, super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Book> favoriteBooks = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteBooksData = prefs.getStringList('favoriteBooks');
    if (favoriteBooksData != null) {
      setState(() {
        favoriteBooks = favoriteBooksData.map((jsonStr) {
          Map<String, dynamic> bookMap = json.decode(jsonStr);
          return Book.fromJson(bookMap);
        }).toList();
      });
    }
  }

  Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteBooksData =
        favoriteBooks.map((book) => json.encode(book.toJson())).toList();
    await prefs.setStringList('favoriteBooks', favoriteBooksData);
  }

  void removeFavorite(Book book) {
    setState(() {
      favoriteBooks.remove(book);
      if (widget.onUnfavorite != null) {
        widget.onUnfavorite!(
            book); // Call the callback function if it is not null
      } // Call the callback function
      saveFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Your Favourites".toUpperCase(),
          style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headlineMedium),
        ),
      ),
      body: favoriteBooks.isEmpty
          ? Center(
              child: Text('No favorites found !!',
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 43, 73, 65),
                          letterSpacing: 1.0))))
          : ListView.builder(
              itemCount: favoriteBooks.length,
              itemBuilder: (context, index) {
                var book = favoriteBooks[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 130, 128, 128),
                          offset: Offset(0.0, 7.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    child: ListTile(
                      title: Text(
                        book.title,
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      subtitle: Text(
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 95, 159, 129),
                            letterSpacing: 1.25,
                          ),
                        ),
                        'Author: ${book.author}\nSession Number: ${book.session}',
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          removeFavorite(book);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
