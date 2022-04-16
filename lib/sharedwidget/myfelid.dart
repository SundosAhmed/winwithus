// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

@override
Widget myfeild(
  TextEditingController controller, {
  String felidname = "",
}) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      height: 55,
      width: 250,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: felidname,
            hintStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ));
}
