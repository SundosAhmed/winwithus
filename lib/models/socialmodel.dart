class SocialMediaModel {
  SocialMediaData? data;
  bool? status;
  int? statusCode;
  String? statusType;

  SocialMediaModel({this.data, this.status, this.statusCode, this.statusType});

  SocialMediaModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? SocialMediaData.fromJson(json['data']) : null;
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

class SocialMediaData {
  String? facebook;
  String? instagram;
  String? youtube;

  SocialMediaData({this.facebook, this.instagram, this.youtube});

  SocialMediaData.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    instagram = json['instagram'];
    youtube = json['youtube'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['youtube'] = this.youtube;
    return data;
  }
}
