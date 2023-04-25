import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycapstone/Screens/profile_edit.dart';

import 'components/numbers_item.dart';
import 'components/profile_item.dart';
import 'model/user.dart';
import 'utils/user_preferences.dart';


void main() => runApp(const MyProfile());

class MyProfile extends StatefulWidget {
  // const MyProfile({Key? key}) : super(key: key);
  const MyProfile({super.key});

  @override
  _MyProfile createState() => _MyProfile();
}

class _MyProfile extends State<MyProfile> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                  'Profile',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
             const SizedBox(height: 10),
            SizedBox(
              // width: 150,
              height: 150,
              child: ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const ProfileEdit(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            buildName(user),
            const SizedBox(height: 24),
            const NumbersWidget(),
            const SizedBox(height: 48),
            buildAbout(user),
          ],
        ),
      ),
    );
  }
}

Widget buildName(User user) => Column(
      children: [
        Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          user.email,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(
          user.phoneNo,
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );

Widget buildAbout(User user) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            user.about,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
