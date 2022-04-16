class TermsModel {
  String? data;
  bool? status;
  int? statusCode;
  String? statusType;

  TermsModel({this.data, this.status, this.statusCode, this.statusType});

  TermsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    status = json['status'];
    statusCode = json['StatusCode'];
    statusType = json['StatusType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data;
    data['status'] = this.status;
    data['StatusCode'] = this.statusCode;
    data['StatusType'] = this.statusType;
    return data;
  }
}
