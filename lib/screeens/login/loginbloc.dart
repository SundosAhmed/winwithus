import 'package:flutter/material.dart';
import 'package:wiin/models/loginmodel.dart';
import 'package:wiin/screeens/begingame/begingame.dart';
import 'package:wiin/utils/http_repositry.dart';

var token;

class Loginbloc {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void callloginrequest(BuildContext context) async {
    if (emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty) {
      HttpRequest().callRequest(
          requestType: REQUEST_TYPE.post,
          methodName: "login",
          body: {
            "email": emailcontroller.text,
            "password": passwordcontroller.text
          }).then((value) {
        var x = LoginModel.fromJson(value);
        token = x.data!.accessToken;
        if (x.statusCode == 200) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Begingame()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  "بيانات الاعتماد هذه غير متطابقة مع البيانات المسجلة لدينا ")));
        }
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("يوجد حقل فارغ ")));
    }
  }
}
