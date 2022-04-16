class AnswerquestionModel {
  String? message;
  bool? status;
  int? statusCode;
  String? statusType;

  AnswerquestionModel(
      {this.message, this.status, this.statusCode, this.statusType});

  AnswerquestionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    statusCode = json['StatusCode'];
    statusType = json['StatusType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['StatusCode'] = this.statusCode;
    data['StatusType'] = this.statusType;
    return data;
  }
}
