// ignore_for_file: void_checks

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wiin/models/questionmodel.dart';
import 'package:wiin/screeens/begingame/brgingamebloc.dart';
import 'package:wiin/screeens/mainscreen/mainscreenbloc.dart';
import 'package:wiin/utils/dialog.dart';

class Answer extends StatefulWidget {
  const Answer({Key? key}) : super(key: key);

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  var bloc = Mainscreenbloc();

  @override
  void initState() {
    bloc.callQuestionrquest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QMod>(
        stream: bloc.streamresponc.stream,
        builder: (ctx, snapshot) {
          if (snapshot.hasData && snapshot.data!.status!) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  height: 60,
                  width: 300,
                  child: Center(
                    child: Text(
                      snapshot.data!.data!.name!,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisExtent: 60),
                    itemCount: snapshot.data!.data!.answers!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                              child: Text(
                                snapshot.data!.data!.answers![index].name!,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              onPressed: () {
                                if (snapshot
                                        .data!.data!.answers![index].right ==
                                    "1") {
                                  // bloc.callAnswrrQuestionrquest(
                                  //     snapshot.data!.data!.answers![index].id!,
                                  //     tid);
                                  bloc.callQuestionrquest();

                                  print(snapshot.data!.data!.name!);
                                  return showTrueDialog(context);
                                } else if (snapshot
                                        .data!.data!.answers![index].right ==
                                    "0") {
                                  bloc.callQuestionrquest();
                                  return showFalseDialog(context);
                                }
                              }));
                    }),
              ],
            );
          } else {
            return Container();
          }
        });
  }
}
