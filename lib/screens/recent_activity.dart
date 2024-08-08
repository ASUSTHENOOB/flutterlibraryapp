import 'package:first_app/Models/Recentactivity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  List<Activity> activities = [];
  DateTime? lastLoginTime;

  @override
  void initState() {
    super.initState();
    loadActivities();
    // Load initial activities or fetch from a data source
    activities.add(Activity(
      description: 'Last Logged In',
      timestamp: DateTime.now().subtract(Duration(minutes: 7)),
      icon: Icons.login,
    ));
    activities.add(Activity(
      description: 'Settings Reviewed',
      timestamp: DateTime.now().subtract(Duration(minutes: 2)),
      icon: Icons.settings,
    ));
    activities.add(Activity(
      description: 'Viewed profile',
      timestamp: DateTime.now().subtract(Duration(minutes: 2)),
      icon: Icons.person,
    ));
  }

  Future<void> saveActivities() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> activityList =
        activities.map((activity) => json.encode(activity.toJson())).toList();
    await prefs.setStringList('activities', activityList);
  }

  Future<void> loadActivities() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? activityList = prefs.getStringList('activities');
    if (activityList != null) {
      setState(() {
        activities = activityList
            .map((activityJson) => Activity.fromJson(json.decode(activityJson)))
            .toList();
      });
    }
  }

  void _logActivity(String description, IconData icon) {
    setState(() {
      activities.insert(
          0,
          Activity(
            description: description,
            timestamp: DateTime.now(),
            icon: icon,
          ));
      saveActivities();
    });
  }

  void _login() {
    setState(() {
      lastLoginTime = DateTime.now();
    });
    _logActivity('Logged in', Icons.login);
  }

  void _viewProfile() {
    _logActivity('Viewed profile', Icons.person);
  }

  void _updateSettings() {
    _logActivity('Updated settings', Icons.settings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onSurface),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "RECENT LOGS",
          style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headlineMedium),
        ),
      ),
      body: Column(
        children: [
          if (lastLoginTime != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Last Login: ${lastLoginTime!.toLocal().toString()}',
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return ListTile(
                  leading: Icon(
                    activity.icon,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(activity.description,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 95, 159, 129),
                              letterSpacing: 1.25))),
                  subtitle: Text(activity.timestamp.toLocal().toString(),
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 95, 159, 129),
                              letterSpacing: 1.25))),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
