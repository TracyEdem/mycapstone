import 'package:flutter/material.dart';

class Head_1Widget extends StatelessWidget {
  final String title;

  const Head_1Widget({
    Key? key, 
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black87),
        ),
        const Spacer(),
        const Text(
          'See More',
          style: TextStyle(color: Colors.black87),
        ),
      ],
    );
  }
}
