import 'package:flutter/material.dart';
import 'package:wiin/screeens/createaccount/createaccount.dart';
import 'package:wiin/screeens/login/loginbloc.dart';

import 'package:wiin/sharedwidget/buttons.dart';
import 'package:wiin/sharedwidget/myfelid.dart';
import 'package:wiin/sharedwidget/textbutton.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  var bloc = Loginbloc();
  @override
  void initState() {
    bloc.emailcontroller.text = "mahamedbadry2003@gmail.com";
    bloc.passwordcontroller.text = "123456789";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        FocusScope.of(context).unfocus();
      }),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
            myfeild(bloc.emailcontroller, felidname: "الايميل"),
            const SizedBox(
              height: 20,
            ),
            myfeild(bloc.passwordcontroller, felidname: "كلمة السر"),
            const SizedBox(
              height: 20,
            ),
            Buttons(
                textname: "دخول",
                ontappress: () {
                  bloc.callloginrequest(context);
                }),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextbutton(
                    name: "انشئ حساب",
                    onpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Createaccountscreen()));
                    }),
                const SizedBox(
                  width: 70,
                ),
                MyTextbutton(
                    name: "نسيت كلمة السر"
                        "",
                    onpress: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}
