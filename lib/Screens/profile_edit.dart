import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/profile_item.dart';
import '../components/textfield_item.dart';
import '../model/user.dart';
import '../utils/user_preferences.dart';

void main() => runApp(const ProfileEdit());

class ProfileEdit extends StatefulWidget {
  // const ProfileEdit({Key? key}) : super(key: key);
  const ProfileEdit({super.key});

  @override
  _ProfileEdit createState() => _ProfileEdit();
}

class _ProfileEdit extends State<ProfileEdit> {
  User user = UserPreferences.myUser;
  // bool isClicked = false;

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
              padding: const EdgeInsets.symmetric(horizontal: 32),
              physics: const BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: user.imagePath,
                  isEdit: true,
                  onClicked: () async {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Full Name',
                  text: user.name,
                  onChanged: (name) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: user.email,
                  onChanged: (email) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'About',
                  text: user.about,
                  maxLines: 5,
                  onChanged: (about) {},
                ),
                const SizedBox(height: 10),
                
              ],
            ),
      ),
    );
  }
}
