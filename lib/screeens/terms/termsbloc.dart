import 'dart:async';

import 'package:wiin/models/termsmodel.dart';
import 'package:wiin/utils/http_repositry.dart';

class TermsBloc {
  StreamController<TermsModel> streamresponce = StreamController<TermsModel>();
  calltermsrquest() async {
    final res = await HttpRequest()
        .callRequest(requestType: REQUEST_TYPE.get, methodName: "/terms");
    streamresponce.sink.add(TermsModel.fromJson(res));
  }
}
