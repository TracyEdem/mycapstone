import 'package:flutter/material.dart';

class User {
  final Image imagePath;
  final String name;
  final String email;
  final String phoneNo;
  final String about;
  final bool isDarkMode;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.about,
    required this.isDarkMode,
  });
}
