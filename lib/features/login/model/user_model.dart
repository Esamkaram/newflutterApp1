class UserModel {
  int? status;
  Data? data;
  String? message;

  UserModel({this.status, this.data, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? token;
  Data2? data;

  Data({this.token, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['Token'];
    data = json['data'] != null ? Data2.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Token'] = token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data2 {
  String? sTUDENTNAME;
  int? sTUDENTID;
  String? sTUDENTYEAR;
  String? sECTION;
  String? sTUDENTTEL;
  String? sTUDENTImg;

  Data2(
      {this.sTUDENTNAME,
      this.sTUDENTID,
      this.sTUDENTYEAR,
      this.sECTION,
      this.sTUDENTTEL,
      this.sTUDENTImg});

  Data2.fromJson(Map<String, dynamic> json) {
    sTUDENTNAME = json['STUDENT_NAME'];
    sTUDENTID = json['STUDENT_ID'];
    sTUDENTYEAR = json['STUDENT_YEAR'];
    sECTION = json['SECTION'];
    sTUDENTTEL = json['STUDENT_TEL'];
    sTUDENTImg = json['STUDENT_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['STUDENT_NAME'] = sTUDENTNAME;
    data['STUDENT_ID'] = sTUDENTID;
    data['STUDENT_YEAR'] = sTUDENTYEAR;
    data['SECTION'] = sECTION;
    data['STUDENT_TEL'] = sTUDENTTEL;
    data['STUDENT_img'] = sTUDENTImg;
    return data;
  }
}
