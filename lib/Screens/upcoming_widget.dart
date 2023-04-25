import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycapstone/components/project_card.dart';
import '../components/heading1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const UpWidget());

class UpWidget extends StatefulWidget {
  // const UpWidget({Key? key}) : super(key: key);
  const UpWidget({super.key});

  @override
  _UpWidgetState createState() => _UpWidgetState();
}

class _UpWidgetState extends State<UpWidget> {
  // bool _isClicked = false;

  List projects = [
    {
      "project_name": 'Kofi\'s Trousers',
      "customer_name": 'Kofi Bempong',
      "status": 'complete',
      "isClicked": false,
    },
    {
      "project_name": 'Eva\'s Skirt',
      "customer_name": 'Eva Owusu',
      "status": 'incomplete',
      "isClicked": false,
    },
    {
      "project_name": 'Test Project 3',
      "customer_name": 'Customer 3',
      "status": 'complete',
      "isClicked": false,
    },
    {
      "project_name": 'Claude\'s Shirt',
      "customer_name": 'Claude Nelson',
      "status": 'incomplete',
      "isClicked": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 10.h),
          child: ListView(
            children: <Widget>[
              const Head_1Widget(
                title: 'Pending Projects',
              ),
              // ProjectCard(isClicked: _isClicked),
              ListView.builder(
                  itemCount: projects.length,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    if (projects[index]["status"] == 'incomplete') {
                      return ProjectCard(
                        isClicked: projects[index]["isClicked"]!,
                        projectName: projects[index]["project_name"],
                        customerName: projects[index]["customer_name"],
                        status: projects[index]["status"],
                        onChanged: (bool? newValue) {
                          setState(
                            () {
                              projects[index]["isClicked"] =
                                  !projects[index]["isClicked"];
                            },
                          );
                        },
                      );
                    } else {
                      return const Spacer();
                    }
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
