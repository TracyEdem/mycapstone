import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components/catalog_grid.dart';
import 'components/heading1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';

void main() => runApp(const MyCatalog());

class MyCatalog extends StatefulWidget {
  // const MyCatalog({Key? key}) : super(key: key);
  const MyCatalog({super.key});

  @override
  _MyCatalog createState() => _MyCatalog();
}

class _MyCatalog extends State<MyCatalog> {
  // String serviceURL = "http://localhost:8000/";
  // List<Uint8List> _images = [];

  // Future<dynamic> fetchImages() async {
  //   final response = await http.get(Uri.parse('${serviceURL}get-img'));
  //   if (response.statusCode == 200) {
  //     final dynamic jsonResponse = json.decode(response.body);
  //     Map<String, dynamic> dictionary = {};
  //     for (var i = 0; i < jsonResponse['images'].length; i++) {
  //       dictionary.addAll(jsonResponse['images'][i]);
  //     }
  //     print('The response is');
  //     print(dictionary);
  //     return dictionary;
  //   } else {
  //     print('Invalid response');
  //   }
  // }

  @override
  void initState() {
    //fetching data
    super.initState();
    // fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              IconButton(
                icon: Icon(
                  FeatherIcons.arrowLeft,
                  size: 25.0.r,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                'Style Catalog',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        body: Padding(
          padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
          child: const GridWidget(),
                    // ),
          ),
        ),
    );
  }
}
