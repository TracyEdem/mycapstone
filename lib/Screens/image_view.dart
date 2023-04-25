import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RouteTwo extends StatelessWidget {
  final String image;
  final String name;

  const RouteTwo({Key? key, required this.image, required this.name})
      : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      body: Column(
	children: [
	  AspectRatio(
	    aspectRatio: 1,
	    child: Container(
	      width: double.infinity,
	      child: Image(
	        image: NetworkImage(image),
	      ),
	    ),
	  ),
	  Container(
	    margin: const EdgeInsets.all(20.0),
	    child: Center(
	      child: Text(
	        name,
	        style: TextStyle(fontSize: 40),
          textAlign: TextAlign.center,
	      ),
	    ),
	  ),
	],
),
    );
  }
}
