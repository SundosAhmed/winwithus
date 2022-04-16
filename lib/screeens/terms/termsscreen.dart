import 'package:flutter/material.dart';

import 'package:wiin/models/termsmodel.dart';
import 'package:wiin/screeens/terms/termsbloc.dart';

class Termsscreen extends StatefulWidget {
  const Termsscreen({Key? key}) : super(key: key);

  @override
  State<Termsscreen> createState() => _TermsscreenState();
}

class _TermsscreenState extends State<Termsscreen> {
  var bloc = TermsBloc();
  @override
  void initState() {
    bloc.calltermsrquest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff031A42),
      body: StreamBuilder<TermsModel>(
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
                        child: const Center(child: Text(" الشروط والاحكام ")),
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
