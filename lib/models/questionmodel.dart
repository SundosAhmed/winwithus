class QMod {
  Data? data;
  bool? status;
  int? statusCode;
  String? statusType;

  QMod({this.data, this.status, this.statusCode, this.statusType});

  QMod.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    statusCode = json['StatusCode'];
    statusType = json['StatusType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['StatusCode'] = this.statusCode;
    data['StatusType'] = this.statusType;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  List<Answers>? answers;

  Data({this.id, this.name, this.answers});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  int? id;
  String? name;
  String? questionId;
  String? right;

  Answers({this.id, this.name, this.questionId, this.right});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    questionId = json['question_id'];
    right = json['right'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['question_id'] = this.questionId;
    data['right'] = this.right;
    return data;
  }
}
