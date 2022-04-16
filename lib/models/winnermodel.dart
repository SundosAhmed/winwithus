class Winnermodel {
  List<Data>? data;
  bool? status;
  int? statusCode;
  String? statusType;

  Winnermodel({this.data, this.status, this.statusCode, this.statusType});

  Winnermodel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    statusCode = json['StatusCode'];
    statusType = json['StatusType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
  String? email;
  String? vip;
  String? profilePhotoUrl;
  String? winTimes;
  String? awardType;
  String? award;
  String? awardPhoto;

  Data(
      {this.id,
      this.name,
      this.email,
      this.vip,
      this.profilePhotoUrl,
      this.winTimes,
      this.awardType,
      this.award,
      this.awardPhoto});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    vip = json['vip'];
    profilePhotoUrl = json['profile_photo_url'];
    winTimes = json['win_times'];
    awardType = json['award_type'];
    award = json['award'];
    awardPhoto = json['award_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['vip'] = this.vip;
    data['profile_photo_url'] = this.profilePhotoUrl;
    data['win_times'] = this.winTimes;
    data['award_type'] = this.awardType;
    data['award'] = this.award;
    data['award_photo'] = this.awardPhoto;
    return data;
  }
}
