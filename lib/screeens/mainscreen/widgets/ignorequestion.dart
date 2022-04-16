import 'package:flutter/material.dart';
import 'package:wiin/models/ignoremodel.dart';
import 'package:wiin/screeens/mainscreen/mainscreenbloc.dart';

class IgnoreQuestion extends StatefulWidget {
  IgnoreQuestion({Key? key}) : super(key: key);

  @override
  State<IgnoreQuestion> createState() => _IgnoreQuestionState();
}

class _IgnoreQuestionState extends State<IgnoreQuestion> {
  var bloc = Mainscreenbloc();
  @override
  void initState() {
    bloc.callignorquestionrquest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<IgnoreModel>(
        stream: bloc.stream3.stream,
        builder: (ctx, snapshot) {
          if (snapshot.hasData && snapshot.data!.status!) {
            return Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  snapshot.data!.data!.data![0].name!,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
