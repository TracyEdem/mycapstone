import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycapstone/Screens/new_client.dart';
import 'package:mycapstone/components/client_card.dart';

import 'components/search_bar.dart';

void main() => runApp(const MyClients());

class MyClients extends StatefulWidget {
  const MyClients({super.key});

  @override
  _MyClients createState() => _MyClients();
}

class _MyClients extends State<MyClients> {
  bool isClicked = false;
  TextEditingController editingController = TextEditingController();
  // final List<String> _suggestions = ['Afeganistan', 'Albania', 'Algeria', 'Australia', 'Brazil', 'German', 'Madagascar', 'Mozambique', 'Portugal', 'Zambia'];

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
                'Client',
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
          child: ListView(
            children: <Widget>[
              SearchBar(editingController: editingController),
              const ClientCard(
                  clientName: 'Akosua Boakye',
                  balance: 50,
                  projectNum: 2,
                  gender: 'Female'),
              const ClientCard(
                  clientName: 'Eva Owusu',
                  balance: 120,
                  projectNum: 3,
                  gender: 'Female'),
              const ClientCard(
                  clientName: 'Kofi Owusu',
                  balance: 340,
                  projectNum: 3,
                  gender: 'Male'),
              const ClientCard(
                  clientName: 'Irene Gates',
                  balance: 0,
                  projectNum: 3,
                  gender: 'Female'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => const NewClient(),
          ),
        );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
