import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycapstone/signup.dart';
import 'home.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392, 834),
        builder: (BuildContext context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'StitchKeeper',
              theme: ThemeData(
                  brightness: Brightness.light,
                  primaryColor: Colors.black,
                  fontFamily: 'Sans'),
              // home: const SignupPage(),
              home: const HomeScreen(),
            ));
  }
}
