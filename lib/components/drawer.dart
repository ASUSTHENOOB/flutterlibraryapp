import 'dart:convert';
import 'package:first_app/Models/returnbook.dart';
import 'package:first_app/components/list_tile.dart';
import 'package:first_app/screens/IssueBook.dart';
import 'package:first_app/screens/ReturnsBook.dart';
import 'package:first_app/screens/favourites_users.dart';
import 'package:first_app/screens/login_screen.dart';
import 'package:first_app/screens/profsetting.dart';
import 'package:first_app/utils/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  final String regno;
  const MyDrawer({super.key, required this.regno});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String accountName = '';
  String accountEmail = '';
  String accountPicture = '';
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.0.106/libApi/fetch_student_info.php?reg_no=${widget.regno}'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          accountName = data['Name'];
          accountEmail = data['Email'];
          // accountPicture = data['photo'];
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load user data';
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

  Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Clear all preferences
    await prefs.clear();
    Navigator.of(context).pop(); // Close the dialog
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout',
              style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.headlineSmall)),
          content: Text('Are you sure you want to log out?',
              style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.titleLarge)),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  overlayColor: Theme.of(context).primaryColorLight),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel',
                  style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.titleLarge)),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColorLight,
                  overlayColor: Theme.of(context).primaryColorLight),
              onPressed: () {
                logoutUser();
                // Add your logout logic here
              },
              child: Text('Logout',
                  style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.titleLarge)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserAccountsDrawerHeader(
            decoration:
                BoxDecoration(color: Theme.of(context).primaryColorLight),
            accountName: isLoading
                ? CircularProgressIndicator()
                : Text(accountName,
                    style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.titleLarge)),
            accountEmail: isLoading
                ? CircularProgressIndicator()
                : Text(accountEmail,
                    style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.titleLarge)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              backgroundImage: AssetImage(
                "images/avatar1.jpg",
              ),
            ),
            onDetailsPressed: () {
              //can lead to some settings navigation
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => profsettings(
                            accname: accountName,
                            accemail: accountEmail,
                          )));
            },
            arrowColor: Theme.of(context).primaryColor,
          ),
          Column(
            children: [
              Mytile(
                  Leading: Icons.home,
                  ontap: () {
                    Navigator.pop(context);
                  },
                  Title: "Home",
                  Trailing: Icons.arrow_right),
              Mytile(
                  Leading: Icons.book,
                  ontap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                IssueBook(regno: widget.regno)));
                  },
                  Title: "Issued",
                  Trailing: Icons.arrow_right),
              Mytile(
                  Leading: Icons.collections_bookmark,
                  ontap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Returnsbook(
                                  regno: widget.regno,
                                )));
                  },
                  Title: "Returned",
                  Trailing: Icons.arrow_right),
              Mytile(
                  Leading: Icons.favorite,
                  ontap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FavoritesPage(onUnfavorite: null),
                        ));
                  },
                  Title: "Favourites",
                  Trailing: Icons.arrow_right),
              Mytile(
                  Leading: Icons.settings,
                  ontap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => profsettings(
                                accemail: accountEmail, accname: accountName)));
                  },
                  Title: "Profile Settings",
                  Trailing: Icons.arrow_right),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Mytile(
                Leading: Icons.logout,
                ontap: () {
                  _showLogoutDialog(context);
                },
                Title: "Logout",
                Trailing: Icons.arrow_right),
          ),
        ],
      ),
    );
  }
}
