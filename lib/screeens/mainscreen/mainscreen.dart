import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wiin/screeens/mainscreen/mainscreenbloc.dart';
import 'package:wiin/screeens/mainscreen/widgets/answaroption.dart';
import 'package:wiin/screeens/mainscreen/widgets/drawar.dart';
import 'package:wiin/screeens/mainscreen/widgets/ignorequestion.dart';
import 'package:wiin/screeens/mainscreen/widgets/questioncontainer.dart';
import 'package:wiin/screeens/mainscreen/widgets/answer.dart';
import 'package:wiin/screeens/mainscreen/widgets/winner.dart';

class Mainscreen extends StatefulWidget {
  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  var bloc = Mainscreenbloc();
  int i = 0;
  int c = 0;
  int counter = 10;
  late Timer timer;
  @override
  void initState() {
    startTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff031A42),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      i = 1;
                      bloc.callQuestionrquest();
                    },
                    icon: Image.asset(
                      "assets/win2.png",
                      scale: 1,
                    )),
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text("حذف اجابتين",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      c = 1;
                    },
                    icon: Image.asset("assets/replace.png")),
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text("تبديل السؤال",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      timer.cancel();
                    },
                    icon: Image.asset("assets/alert.png")),
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text("إيقاف الوقت",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                )
              ],
            ),
            IconButton(
                onPressed: () {}, icon: Image.asset("assets/Path 189.png")),
          ]),
        ),
        drawer: const Drawarr(),
        backgroundColor: const Color(0xff031A42),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/winr.png",
              ),
              const SizedBox(
                height: 30,
              ),
              c == 0 ? Answer() : IgnoreQuestion(),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 50,
                child: Center(
                    child: Text(
                  "$counter",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: counter >= 6
                          ? Colors.black
                          : counter >= 4
                              ? Colors.yellow
                              : Colors.red),
                )),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
              ),
              // i == 0 ? const Answer() : Answeroption(),
              const SizedBox(
                height: 20,
              ),
              const Winner(),
            ],
          ),
        )
        // ListView(
        //   children: [
        //     Image.asset(
        //       "assets/winr.png",
        //     ),
        // c == 0 ? Questioncontainer() : IgnoreQuestion(),
        // const SizedBox(
        //   height: 20,
        // ),
        // Container(
        //   child: Center(
        //       child: Text(
        //     "$counter",
        //     style: TextStyle(
        //         fontWeight: FontWeight.bold,
        //         fontSize: 17,
        //         color: counter >= 6
        //             ? Colors.black
        //             : counter >= 4
        //                 ? Colors.yellow
        //                 : Colors.red),
        //   )),
        //   decoration: BoxDecoration(
        //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
        //   height: 50,
        // ),
        //     i == 0 ? const Answer() : Answeroption(),
        //     const SizedBox(
        //       height: 20,
        //     ),
        //     const Winner(),
        //   ],
        // )
        );
  }

  startTimer() {
    counter = 10;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (counter > 0) {
          counter--;
        }
      });
    });
  }
}
