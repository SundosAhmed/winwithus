import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wiin/models/createtrial.dart';
import 'package:wiin/screeens/mainscreen/mainscreen.dart';
import 'package:wiin/utils/http_repositry.dart';

var tid;

class CreateTrailbloc {
  callCrateTrailrquest(BuildContext context) async {
    final res = await HttpRequest().callRequest(
        requestType: REQUEST_TYPE.post, methodName: "/create-trail");
    var x = CreateTrailModel.fromJson(res);
    tid = x.data!.id!;
    if (x.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Mainscreen()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Mainscreen()));
    }
  }
}
