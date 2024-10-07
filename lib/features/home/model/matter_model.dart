class MatterModel {
  int? status;
  List<MatterItem>? data;
  String? message;

  MatterModel({this.status, this.data, this.message});

  MatterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <MatterItem>[];
      json['data'].forEach((v) {
        data!.add(MatterItem.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class MatterItem {
  int? matterId;
  String? matterName;
  String? matterImg;
  List<Teacher>? teacher;

  MatterItem({this.matterId, this.matterName, this.matterImg, this.teacher});

  MatterItem.fromJson(Map<String, dynamic> json) {
    matterId = json['matter_id'];
    matterName = json['matter_name'];
    matterImg = json['matter_img'];
    if (json['teacher'] != null) {
      teacher = <Teacher>[];
      json['teacher'].forEach((v) {
        teacher!.add(Teacher.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matter_id'] = matterId;
    data['matter_name'] = matterName;
    data['matter_img'] = matterImg;
    if (teacher != null) {
      data['teacher'] = teacher!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teacher {
  int? tEACHERID;
  String? tEACHERNAME;
  String? tEACHERIMG;
  String? iMGPROLINK;

  Teacher({this.tEACHERID, this.tEACHERNAME, this.tEACHERIMG, this.iMGPROLINK});

  Teacher.fromJson(Map<String, dynamic> json) {
    tEACHERID = json['TEACHER_ID'];
    tEACHERNAME = json['TEACHER_NAME'];
    tEACHERIMG = json['TEACHER_IMG'];
    iMGPROLINK = json['IMG_PRO_LINK'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['TEACHER_ID'] = tEACHERID;
    data['TEACHER_NAME'] = tEACHERNAME;
    data['TEACHER_IMG'] = tEACHERIMG;
    data['IMG_PRO_LINK'] = iMGPROLINK;
    return data;
  }
}
