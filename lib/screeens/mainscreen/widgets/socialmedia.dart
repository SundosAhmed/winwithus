import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wiin/models/socialmodel.dart';
import 'package:wiin/screeens/mainscreen/mainscreenbloc.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({Key? key}) : super(key: key);

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  var bloc = Mainscreenbloc();

  @override
  void initState() {
    bloc.callSocialMediarquest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SocialMediaModel>(
        stream: bloc.streamresponse.stream,
        builder: (ctx, snapshot) {
          if (snapshot.hasData && snapshot.data!.status!) {
            return Row(
              children: [
                InkWell(
                  onTap: () async {
                    final url = snapshot.data!.data!.facebook!;
                    if (await launch(url)) {
                      await launch(url);
                    } else {
                      throw "could not lunch $url";
                    }
                  },
                  child: Image.asset(
                    "assets/facebook.png",
                    scale: 1.5,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final url = snapshot.data!.data!.instagram!;
                    if (await launch(url)) {
                      await launch(url);
                    } else {
                      throw "could not lunch $url";
                    }
                  },
                  child: Image.asset(
                    "assets/insta.png",
                    scale: 1.5,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final url = snapshot.data!.data!.youtube!;
                    if (await launch(url)) {
                      await launch(url);
                    } else {
                      throw "could not lunch $url";
                    }
                  },
                  child: Image.asset(
                    "assets/youtube.png",
                    scale: 1.5,
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        });
  }
}
