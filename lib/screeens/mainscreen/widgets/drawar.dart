import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wiin/screeens/home/homescreen.dart';
import 'package:wiin/screeens/inforationaboutapp/informationaboutapp.dart';
import 'package:wiin/screeens/mainscreen/mainscreenbloc.dart';
import 'package:wiin/screeens/mainscreen/widgets/socialmedia.dart';
import 'package:wiin/screeens/terms/termsscreen.dart';

class Drawarr extends StatefulWidget {
  const Drawarr({Key? key}) : super(key: key);

  @override
  State<Drawarr> createState() => _DrawarrState();
}

class _DrawarrState extends State<Drawarr> {
  var bloc = Mainscreenbloc();

  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
      width: 220,
      height: 550,
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xff031A42),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 50),
                child: Text(
                  "اهلا بك ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 20),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Image.asset("assets/money.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "اشتراك شهري",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InformationAboutAPP()));
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/information.png",
                        scale: 1.5,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "معلومات عن التطبيق",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 20),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Image.asset("assets/lock.png"),
                      const SizedBox(
                        width: 18,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "سياسة الخصوصية",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Homepage()));
                },
                child: Row(
                  children: [
                    Image.asset("assets/logout.png"),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "تسجيل خروج",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Termsscreen()));
                  },
                  child: const Text(
                    "الشروط و الاحكام",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "تابعنا على",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SocialMedia()
            ],
          ),
        ),
      ),
    );
  }

  launchURL(url) async {
    if (await launch(url)) {
      await launch(url);
    } else {
      throw "could not lunch $url";
    }
  }
}
