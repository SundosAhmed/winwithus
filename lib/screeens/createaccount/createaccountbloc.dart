import 'package:flutter/material.dart';
import 'package:wiin/models/createaccountmodel.dart';
import 'package:wiin/utils/http_repositry.dart';

class CreateAccountBloc {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void callcreateaccountrequest(BuildContext context) async {
    if (emailcontroller.text.isNotEmpty &&
        passwordcontroller.text.isNotEmpty &&
        namecontroller.text.isNotEmpty) {
      HttpRequest().callRequest(
          requestType: REQUEST_TYPE.post,
          methodName: "register",
          body: {
            "name": namecontroller.text,
            "email": emailcontroller.text,
            "password": passwordcontroller.text
          }).then((value) {
        var x = RegisterModel.fromJson(value);
        if (x.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  "تم إنشاء حسابك, يرجى تفعيله من خلال الرابط المرسل على الإيميل المسجل ")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("قيمة البريد الالكتروني مستخدمة من قبل ")));
        }
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("يوجد حقل فارغ")));
    }
  }
}
