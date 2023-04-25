import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.editingController,
  }) : super(key: key);

  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: editingController,
      decoration: const InputDecoration(
          labelText: "Search",
          labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.black54, fontSize: 15),
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)))),
    );
  }
}
