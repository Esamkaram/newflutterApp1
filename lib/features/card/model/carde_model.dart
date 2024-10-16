class Carde {
  String? studentId;
  int? teacherId;
  String? teacherName;
  int? matterId;
  int? dayID;
  String? dayName;
  String? timeTh;

  Carde(
      {this.studentId,
      this.matterId,
      this.teacherId,
      this.timeTh,
      this.dayID,
      this.dayName,
      this.teacherName});

  Carde.fromJson(Map<String, dynamic> json) {
    studentId = json['STUDENT_ID'];
    teacherId = json['TEACHER_ID'];
    teacherName = json['TEACHER_NAME'];
    matterId = json['MATTER_ID'];
    dayID = json['DAY_ID'];
    dayName = json['DAY_NAME'];
    timeTh = json['TIME_TH'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['STUDENT_ID'] = studentId;
    data['TEACHER_ID'] = teacherId;
    data['MATTER_ID'] = matterId;
    data['TIME_TH'] = timeTh;
    data['DAY_ID'] = dayID;
    data['DAY_NAME'] = dayName;
    data['TEACHER_NAME'] = teacherName;
    return data;
  }
}
