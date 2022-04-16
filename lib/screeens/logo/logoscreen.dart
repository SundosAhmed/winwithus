import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wiin/screeens/home/homescreen.dart';

class Logoscreen extends StatefulWidget {
  const Logoscreen({Key? key}) : super(key: key);

  @override
  State<Logoscreen> createState() => _LogoscreenState();
}

class _LogoscreenState extends State<Logoscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Homepage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff031A42),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/win.png",
              scale: 1,
            ),
          )
        ],
      ),
    );
  }
}
