import 'dart:async';

import 'package:wiin/models/aboutapp.dart';
import 'package:wiin/utils/http_repositry.dart';

class AboutAppBloc {
  StreamController<Aboutapp> streamresponce = StreamController<Aboutapp>();
  callaboutapprquest() async {
    final res = await HttpRequest()
        .callRequest(requestType: REQUEST_TYPE.get, methodName: "/about-app");
    streamresponce.sink.add(Aboutapp.fromJson(res));
  }
}
