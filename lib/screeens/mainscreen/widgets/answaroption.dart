import 'package:flutter/material.dart';
import 'package:wiin/models/deleteoptionmoddel.dart';
import 'package:wiin/screeens/mainscreen/mainscreenbloc.dart';
import 'package:wiin/screeens/mainscreen/widgets/questioncontainer.dart';
import 'package:wiin/utils/dialog.dart';

class Answeroption extends StatefulWidget {
  Answeroption({Key? key}) : super(key: key);

  @override
  State<Answeroption> createState() => _AnsweroptionState();
}

class _AnsweroptionState extends State<Answeroption> {
  var bloc = Mainscreenbloc();
  @override
  void initState() {
    bloc.callDeleterquest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DeleteModel>(
        stream: bloc.stream.stream,
        builder: (ctx, snapshot) {
          if (snapshot.hasData && snapshot.data!.status!) {
            return GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 60),
                itemCount: snapshot.data!.data!.answers!.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
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
                            if (snapshot.data!.data!.answers![index].right ==
                                "1") {
                              return showTrueDialog(context);
                            } else {
                              return showFalseDialog(context);
                            }
                          }));
                });
          } else {
            return Container();
          }
        });
  }
}
