import 'package:flutter/material.dart';

showFalseDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.red,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.close,
          size: 100,
          color: Colors.white,
        ),
        Text(
          "اجابة خاطئة ",
          style: TextStyle(color: Colors.white, fontSize: 18),
        )
      ],
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showTrueDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    backgroundColor: const Color(0xffDEED0E),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Image.asset("assets/check.png"), const Text("اجابة صحيحة")],
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
