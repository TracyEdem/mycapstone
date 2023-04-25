import 'package:flutter/material.dart';
import '../model/user.dart';

class UserPreferences {
  static var myUser = User(
    imagePath:
        // 'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
        Image.asset('assets/images/Ashesi Portraits (261).JPG'),
    name: 'Tracy Ameyibor',
    email: 'tracy.ameyibor@ashesi.edu.gh',
    phoneNo: '+233454898754',
    about:
        'Student at Ashesi University.',
    isDarkMode: true,
  );
}
