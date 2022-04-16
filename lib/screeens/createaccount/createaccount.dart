import 'package:flutter/material.dart';
import 'package:wiin/screeens/createaccount/createaccountbloc.dart';
import 'package:wiin/screeens/login/loginscreen.dart';
import 'package:wiin/sharedwidget/buttons.dart';
import 'package:wiin/sharedwidget/myfelid.dart';
import 'package:wiin/sharedwidget/textbutton.dart';

class Createaccountscreen extends StatefulWidget {
  const Createaccountscreen({Key? key}) : super(key: key);

  @override
  State<Createaccountscreen> createState() => _CreateaccountscreenState();
}

class _CreateaccountscreenState extends State<Createaccountscreen> {
  var bloc = CreateAccountBloc();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xff031A42),
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Image.asset(
                "assets/win.png",
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: myfeild(bloc.namecontroller, felidname: "الاسم")),
            myfeild(bloc.emailcontroller, felidname: "الايميل"),
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child:
                    myfeild(bloc.passwordcontroller, felidname: "كلمة السر")),
            Buttons(
                textname: "ارسال ",
                ontappress: () {
                  bloc.callcreateaccountrequest(context);
                }),
            const SizedBox(
              height: 20,
            ),
            MyTextbutton(
                name: "تسجيل الدخول",
                onpress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Loginscreen()));
                })
          ])),
    );
  }
}
