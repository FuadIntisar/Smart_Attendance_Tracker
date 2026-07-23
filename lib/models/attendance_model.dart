class AttendanceModel {
  final String studentId;
  final String course;
  final String section;
  final String sessionId;
  final String date;
  final String time;

  AttendanceModel({
    required this.studentId,
    required this.course,
    required this.section,
    required this.sessionId,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toJson() {
    return {
      'studentId': studentId,
      'course': course,
      'section': section,
      'sessionId': sessionId,
      'date': date,
      'time': time,
    };
  }

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      studentId: json['studentId'],
      course: json['course'],
      section: json['section'],
      sessionId: json['sessionId'],
      date: json['date'],
      time: json['time'],
    );
  }
}