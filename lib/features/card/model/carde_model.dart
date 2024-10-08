class Carde {
  String? studentId;
  int? teacherId;
  int? matterId;
  String? timeTh;

  Carde({this.studentId, this.matterId, this.teacherId, this.timeTh});
  Carde.fromJson(Map<String, dynamic> json) {
    studentId = json['STUDENT_ID'];
    teacherId = json['TEACHER_ID'];
    matterId = json['MATTER_ID'];
    timeTh = json['TIME_TH'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['STUDENT_ID'] = studentId;
    data['TEACHER_ID'] = teacherId;
    data['MATTER_ID'] = matterId;
    data['TIME_TH'] = timeTh;
    return data;
  }
}
