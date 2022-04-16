import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextbutton extends StatelessWidget {
  String name;
  VoidCallback onpress;
  MyTextbutton({Key? key, required this.name, required this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpress,
      child: Text(
        name,
        style: const TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
