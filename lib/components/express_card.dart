import 'dart:ffi';

import 'package:flutter/material.dart';

class ExpressCard extends StatelessWidget {
  final String projectName;
  final String customerName;
  final String status;
  final DateTime date;
  final double fee;

  const ExpressCard({
    Key? key,
    required this.projectName,
    required this.customerName,
    required this.fee,
    required this.status,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 90,
      width: double.maxFinite,
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                projectName,
                style: const TextStyle(color: Colors.black87),
              ),
              subtitle: Text(
                customerName,
                style: const TextStyle(color: Colors.black87),
              ),
              trailing: Text(
                'GHS $fee',
                style: const TextStyle(color: Color.fromARGB(179, 255, 0, 0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
