import 'package:flutter/material.dart';
import 'package:wiin/screeens/begingame/brgingamebloc.dart';
import 'package:wiin/screeens/mainscreen/mainscreen.dart';
import 'package:wiin/sharedwidget/buttons.dart';

class Begingame extends StatefulWidget {
  @override
  State<Begingame> createState() => _BegingameState();
}

class _BegingameState extends State<Begingame> {
  var bloc = CreateTrailbloc();
  @override
  // void initState() {
  //   bloc.callCrateTrailrquest(context);
  //   super.initState();
  // }

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
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Buttons(
            textname: "ابدأ المسابقة",
            ontappress: () {
              // bloc.callCrateTrailrquest(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Mainscreen()));
            },
          ),
        ],
      ),
    );
  }
}
