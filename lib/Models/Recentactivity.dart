import 'package:flutter/material.dart';

class Activity {
  String description;
  DateTime timestamp;
  IconData icon;

  Activity({
    required this.description,
    required this.timestamp,
    required this.icon,
  });

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'timestamp': timestamp.toIso8601String(),
      'icon': icon.codePoint,
    };
  }

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      description: json['description'],
      timestamp: DateTime.parse(json['timestamp']),
      icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
    );
  }
}
