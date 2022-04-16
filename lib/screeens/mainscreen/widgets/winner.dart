import 'package:flutter/material.dart';
import 'package:wiin/models/winnermodel.dart';
import 'package:wiin/screeens/mainscreen/mainscreenbloc.dart';

class Winner extends StatefulWidget {
  const Winner({Key? key}) : super(key: key);

  @override
  State<Winner> createState() => _WinnerState();
}

class _WinnerState extends State<Winner> {
  var bloc = Mainscreenbloc();

  @override
  void initState() {
    bloc.callWinnerrquest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Winnermodel>(
        stream: bloc.stramresponce.stream,
        builder: (ctx, snapshot) {
          if (snapshot.hasData && snapshot.data!.status!) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width - 80,
                    child: PageView.builder(
                        controller: PageController(
                            initialPage: 0, viewportFraction: 0.8),
                        onPageChanged: (index) {},
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xff414D72),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Text(
                                      snapshot.data!.data![index].name!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            snapshot.data!.data![index]
                                                .profilePhotoUrl!,
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff141D37)),
                                  ),
                                  Text(
                                    snapshot.data!.data![index].awardType!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })),
              ],
            );
          } else {
            return Container();
          }
        });
  }
}
