import 'dart:convert';
import 'package:first_app/Models/book.dart';
import 'package:first_app/components/Search_bookfield.dart';
import 'package:first_app/screens/favourites_users.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  List<Book> books = [];
  List<Book> filteredBooks = [];
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
      final response = await http
          .get(Uri.parse('http://192.168.0.106/libApi/showbooks.php'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<Book> fetchedBooks =
            data.map((json) => Book.fromJson(json)).toList();
        await loadFavorites(fetchedBooks); // Load favorites into the book list
        setState(() {
          books = fetchedBooks;
          filterBooks(); // Apply filtering and sorting after loading data and favorites
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load book data';
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
    List<Book> _books = [];
    _books.addAll(books);
    if (searchController.text.isNotEmpty) {
      _books.retainWhere((book) {
        String searchTerm = searchController.text.toLowerCase();
        String bookTitle = book.title.toLowerCase();
        String authorName = book.author.toLowerCase();
        String sessionNumber = book.session.toString();
        return bookTitle.contains(searchTerm) ||
            authorName.contains(searchTerm) ||
            sessionNumber.contains(searchTerm);
      });
    }
    setState(() {
      _books.sort((a, b) => b.isFavorite ? 1 : -1); // Sort books by favorites
      filteredBooks = _books;
    });
  }

  Future<void> saveFavorites() async {
    //Encode all favourite books Into Json so that can be used for later used for matching//
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteBooks = books
        .where((book) => book.isFavorite)
        .map((book) => json.encode(book.toJson()))
        .toList();
    await prefs.setStringList('favoriteBooks', favoriteBooks);
  }

  Future<void> loadFavorites(List<Book> fetchedBooks) async {
    //Simply load the specified books from JSON and match booktitle with the favourite ones titles
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteBooks = prefs.getStringList('favoriteBooks');
    if (favoriteBooks != null) {
      for (String bookJson in favoriteBooks) {
        Map<String, dynamic> bookMap = json.decode(bookJson);
        Book favoriteBook = Book.fromJson(bookMap);
        for (Book book in fetchedBooks) {
          if (book.title == favoriteBook.title) {
            book.isFavorite = true;
            break;
          }
        }
      }
    }
  }

  void handleUnfavorite(Book book) {
    setState(() {
      for (Book b in books) {
        if (b.title == book.title) {
          b.isFavorite = false;
          break;
        }
      }
      saveFavorites();
      filterBooks(); // Reapply filtering and sorting after unfavoriting
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "All Books".toUpperCase(),
          style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headlineMedium),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritesPage(
                      onUnfavorite: handleUnfavorite,
                    ),
                  ),
                );
                // Refresh books after returning from the favorites page
                setState(() {
                  filterBooks();
                });
              },
            ),
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
                hintName: "Search By  BookName, Author ,Session No !",
              )),
          Expanded(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ))
                : errorMessage.isNotEmpty
                    ? Center(child: Text(errorMessage))
                    : filteredBooks.isEmpty
                        ? Center(child: Text('No books found'))
                        : ListView.builder(
                            itemCount: filteredBooks.length,
                            itemBuilder: (context, index) {
                              var book = filteredBooks[index];
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
                                      book.title,
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
                                        'Author: ${book.author}\nSession Number: ${book.session}'),
                                    trailing: IconButton(
                                      icon: Icon(
                                        book.isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: book.isFavorite
                                            ? Theme.of(context).primaryColor
                                            : Color.fromARGB(255, 95, 159, 129),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          book.isFavorite = !book.isFavorite;
                                          saveFavorites(); // Save favorites when changed
                                          filterBooks(); // Reapply filtering and sorting after favorite toggle
                                        });
                                      },
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
