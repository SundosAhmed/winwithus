import 'dart:async';

import 'package:wiin/models/answerquestion.dart';
import 'package:wiin/models/deleteoptionmoddel.dart';
import 'package:wiin/models/ignoremodel.dart';
import 'package:wiin/models/questionmodel.dart';
import 'package:wiin/models/socialmodel.dart';
import 'package:wiin/models/winnermodel.dart';
import 'package:wiin/utils/http_repositry.dart';

var idquestion;

class Mainscreenbloc {
  StreamController<QMod> streamresponc = StreamController<QMod>();
  callQuestionrquest() async {
    var res = await HttpRequest().callRequest(
      requestType: REQUEST_TYPE.get,
      methodName: "questions",
    );
    var s = QMod.fromJson(res);
    streamresponc.sink.add(s);

    idquestion = s.data!.id;
  }

  StreamController<SocialMediaModel> streamresponse =
      StreamController<SocialMediaModel>();
  callSocialMediarquest() async {
    final res = await HttpRequest().callRequest(
        requestType: REQUEST_TYPE.get, methodName: "/social-links");
    streamresponse.sink.add(SocialMediaModel.fromJson(res));
  }

  StreamController<Winnermodel> stramresponce = StreamController<Winnermodel>();
  callWinnerrquest() async {
    final res = await HttpRequest()
        .callRequest(requestType: REQUEST_TYPE.get, methodName: "/winners");
    stramresponce.sink.add(Winnermodel.fromJson(res));
  }

  StreamController<DeleteModel> stream = StreamController<DeleteModel>();
  callDeleterquest() async {
    final res = await HttpRequest().callRequest(
      requestType: REQUEST_TYPE.post,
      methodName: "/delete-options/$idquestion",
    );

    stream.sink.add(DeleteModel.fromJson(res));
  }

  StreamController<IgnoreModel> stream3 = StreamController<IgnoreModel>();
  callignorquestionrquest() async {
    await HttpRequest()
        .callRequest(
      requestType: REQUEST_TYPE.post,
      methodName: "/ignore-question/$idquestion",
    )
        .then((value) {
      return stream3.sink.add(IgnoreModel.fromJson(value));
    });
  }

  StreamController<AnswerquestionModel> stream4 =
      StreamController<AnswerquestionModel>();
  callAnswrrQuestionrquest(int id, int trailid) async {
    await HttpRequest().callRequest(
        requestType: REQUEST_TYPE.post,
        methodName: "/answer-question/$idquestion",
        body: {"answer_id": id, "trail_id": trailid}).then((value) {
      return stream4.sink.add(AnswerquestionModel.fromJson(value));
    });
  }
}
