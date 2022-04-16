import 'package:flutter/material.dart';
import 'package:wiin/models/aboutapp.dart';
import 'package:wiin/screeens/inforationaboutapp/informationbloc.dart';

class InformationAboutAPP extends StatefulWidget {
  const InformationAboutAPP({Key? key}) : super(key: key);

  @override
  State<InformationAboutAPP> createState() => _InformationAboutAPPState();
}

class _InformationAboutAPPState extends State<InformationAboutAPP> {
  var bloc = AboutAppBloc();
  @override
  void initState() {
    bloc.callaboutapprquest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff031A42),
      body: StreamBuilder<Aboutapp>(
        stream: bloc.streamresponce.stream,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData && snapshot.data!.status!) {
            return SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      const SizedBox(
                        width: 70,
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(child: Text("معلومات عن التطبيق")),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 50),
                    child: Container(
                      color: Colors.white,
                      height: 600,
                      width: MediaQuery.of(context).size.width,
                      child: Text(snapshot.data!.data!),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
