import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Buttons extends StatelessWidget {
  String textname;
  VoidCallback ontappress;

  Buttons({Key? key, required this.textname, required this.ontappress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontappress,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        height: 45,
        width: 180,
        child: Center(
          child: Text(
            textname,
            style: const TextStyle(
                fontSize: 20,
                color: Color(0xff707070),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
