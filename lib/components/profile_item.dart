import 'dart:io';

import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final Image imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final color = Theme.of(context).colorScheme.primary;
    final color = const Color(0xff764abc);

    return Center(
      child: Stack(
        children: [
          buildCircle(color: Colors.transparent, all: 0, child: imagePath),
          Positioned(
            bottom: 0,
            right: 0,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 0,
        child: buildCircle(
          color: color,
          all: 0,
          child: IconButton(
            icon: Icon(isEdit ? Icons.add_a_photo : Icons.edit),
            color: Colors.white,
            onPressed: onClicked,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          // width: 20,
          // height: 20,
          child: child,
          // fit: BoxFit.cover,
        ),
      );
}
