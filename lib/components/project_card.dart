import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String projectName;
  final String customerName;
  final String status;
  final void Function(bool?) onChanged;
  final bool _isClicked;

  const ProjectCard({
    Key? key,
    required bool isClicked,
    required this.projectName,
    required this.customerName,
    required this.status,
    required this.onChanged,
  })  : _isClicked = isClicked,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 90,
      width: double.maxFinite,
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: CheckboxListTile(
          //checkbox positioned at left
          value: _isClicked,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: onChanged,
          title: Text(
            projectName,
            style: const TextStyle(color: Colors.black87),
          ),
          subtitle: Text(
            customerName,
            style: const TextStyle(color: Colors.black87),
          ), 
        ),
      ),
    );
  }
}
