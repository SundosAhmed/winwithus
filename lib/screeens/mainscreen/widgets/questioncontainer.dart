// import 'package:flutter/material.dart';

// import 'package:wiin/models/questionmodel.dart';

// import 'package:wiin/screeens/mainscreen/mainscreenbloc.dart';

// class Questioncontainer extends StatefulWidget {
//   @override
//   State<Questioncontainer> createState() => _QuestioncontainerState();
// }

// var bloc = Mainscreenbloc();

// class _QuestioncontainerState extends State<Questioncontainer> {
//   @override
//   @override
//   void initState() {
//     bloc.callQuestionrquest();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QMod>(
//         stream: bloc.streamresponc.stream,
//         builder: (ctx, snapshot) {
//           if (snapshot.hasData && snapshot.data!.status!) {
//             return GridView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.vertical,
//                 physics: const ScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 1, mainAxisExtent: 60),
//                 itemCount: 1,
//                 itemBuilder: (BuildContext ctx, index) {
//                   return Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30)),
//                     height: 60,
//                     width: 300,
//                     child: Center(
//                       child: Text(
//                         snapshot.data!.data!.name!,
//                         style: const TextStyle(fontSize: 18),
//                       ),
//                     ),
//                   );
//                 });
//           } else {
//             return Container();
//           }
//         });
//   }
// }
