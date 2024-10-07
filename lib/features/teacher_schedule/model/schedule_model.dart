class ScheduleModel {
  int? status;
  Date? date;
  String? message;

  ScheduleModel({this.status, this.date, this.message});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    date = json['date'] != null ? Date.fromJson(json['date']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (date != null) {
      data['date'] = date!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Date {
  int? teacherId;
  String? teacherName;
  int? countMatter;
  List<Schedule>? schedule;

  Date({this.teacherId, this.teacherName, this.countMatter, this.schedule});

  Date.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    teacherName = json['teacher_name'];
    countMatter = json['count_matter'];
    if (json['schedule'] != null) {
      schedule = <Schedule>[];
      json['schedule'].forEach((v) {
        schedule!.add(Schedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teacher_id'] = teacherId;
    data['teacher_name'] = teacherName;
    data['count_matter'] = countMatter;
    if (schedule != null) {
      data['schedule'] = schedule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schedule {
  String? cENTERNAME;
  String? dAYID;
  String? dAYNAME;
  String? tIMETH;
  int? cOSTNUM;
  int? sERIALNUM;

  Schedule(
      {this.cENTERNAME,
      this.dAYID,
      this.dAYNAME,
      this.tIMETH,
      this.cOSTNUM,
      this.sERIALNUM});

  Schedule.fromJson(Map<String, dynamic> json) {
    cENTERNAME = json['CENTER_NAME'];
    dAYID = json['DAY_ID'];
    dAYNAME = json['DAY_NAME'];
    tIMETH = json['TIME_TH'];
    cOSTNUM = json['COST_NUM'];
    sERIALNUM = json['SERIAL_NUM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CENTER_NAME'] = cENTERNAME;
    data['DAY_ID'] = dAYID;
    data['DAY_NAME'] = dAYNAME;
    data['TIME_TH'] = tIMETH;
    data['COST_NUM'] = cOSTNUM;
    data['SERIAL_NUM'] = sERIALNUM;
    return data;
  }
}
