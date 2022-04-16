import 'package:flutter/material.dart';
import 'package:wiin/screeens/createaccount/createaccount.dart';
import 'package:wiin/screeens/login/loginscreen.dart';
import 'package:wiin/sharedwidget/buttons.dart';
import 'package:wiin/sharedwidget/textbutton.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Buttons(
            textname: "أنشئ حساب ",
            ontappress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Createaccountscreen()));
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Buttons(
              textname: "تسجيل دخول ",
              ontappress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Loginscreen()));
              }),
          const SizedBox(
            height: 20,
          ),
          MyTextbutton(name: "نسيت كلمة السر", onpress: () {})
        ],
      ),
    );
  }
}
