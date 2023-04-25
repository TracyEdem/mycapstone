import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final String pageName;
  final IconData pageIcon;
  final Widget page;

  const DrawerWidget({
    Key? key,
    required this.pageName,
    required this.pageIcon, 
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        pageIcon,
        color: Colors.white,
      ),
      title: Text(
        pageName,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => page,
          ),
        );
      },
    );
  }
}
