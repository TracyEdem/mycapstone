import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycapstone/Screens/home_widget.dart';
import 'package:mycapstone/Screens/upcoming_widget.dart';
import 'package:mycapstone/Screens/new_widget.dart';
import 'package:mycapstone/calendar.dart';
import 'package:mycapstone/catalog.dart';
import 'package:mycapstone/clients.dart';
import 'package:mycapstone/profile.dart';
import 'package:mycapstone/signup.dart';

import 'components/drawer_item.dart';
import 'login.dart';

// import 'home.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyAppState();
}

class _MyAppState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MyAppExt());
  }
}

class MyAppExt extends StatefulWidget {
  const MyAppExt({super.key});

  @override
  State<MyAppExt> createState() => _MyAppExtState();
}

class _MyAppExtState extends State<MyAppExt> {
  String buttonName = 'Click';
  int currentIndex = 0;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // title: Row(children: [
        //   Icon(
        //     FeatherIcons.menu,
        //     size: 25.0.r(),
        //     color: Colors.white,
        //   )
        // ]),
        actions: [
          Icon(
            FeatherIcons.map,
            size: 20.0.r,
            color: Colors.white,
          ),
          SizedBox(width: 20.w),
          Icon(
            FeatherIcons.bell,
            size: 20.0.r,
            color: Colors.white,
          ),
          SizedBox(width: 18.w),
          Icon(
            FeatherIcons.helpCircle,
            size: 20.0.r,
            color: Colors.white,
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: const[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xff764abc)),
              accountName: Text(
                'Tracy Edem',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                'tracy.ameyibor@ashesi.edu.gh',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: FlutterLogo(),
            ),
            DrawerWidget(
              pageName: 'Home',
              pageIcon: Icons.home,
              page: MyAppExt(),
            ),
            DrawerWidget(
              pageName: 'Profile',
              pageIcon: Icons.account_circle,
              page: MyProfile(),
            ),
            DrawerWidget(
              pageName: 'Clients',
              pageIcon: Icons.group,
              page: MyClients(),
            ),
            DrawerWidget(
              pageName: 'Catalog',
              pageIcon: Icons.storefront,
              page: MyCatalog(),
            ),
            DrawerWidget(
              pageName: 'Calendar',
              pageIcon: Icons.calendar_month,
              page: MyCalendar(),
            ),
            DrawerWidget(
              pageName: 'Log Out',
              pageIcon: Icons.logout_outlined,
              page: LoginPage(),
            ),
          ],
        ),
      ),
      body: <Widget>[
        const HomeWidget(),
        const NewWidget(),
        const UpWidget(),
      ][currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              // Icons.home,
              FeatherIcons.home,
              size: 20.0.r,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Add Project',
            icon: Icon(
              // Icons.add_box_outlined,
              FeatherIcons.plusSquare,
              size: 20.0.r,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Upcoming',
            icon: Icon(
              // Icons.list_alt_rounded,
              FeatherIcons.list,
              size: 20.0.r,
              color: Colors.white,
            ),
          )
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(
            () {
              currentIndex = index;
            },
          );
        },
      ),
    );
  }
}

