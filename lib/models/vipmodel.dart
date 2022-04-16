class VipModel {
  Data? data;
  bool? status;
  int? statusCode;
  String? statusType;

  VipModel({this.data, this.status, this.statusCode, this.statusType});

  VipModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    statusCode = json['StatusCode'];
    statusType = json['StatusType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  String? months;
  String? price;

  Data({this.id, this.name, this.months, this.price});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    months = json['months'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['months'] = this.months;
    data['price'] = this.price;
    return data;
  }
}
