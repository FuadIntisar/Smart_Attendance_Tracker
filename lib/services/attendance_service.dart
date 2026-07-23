import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/attendance_model.dart';

class AttendanceService {
  static const String attendanceKey = 'attendance_records';

  Future<void> saveAttendance(AttendanceModel attendance) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> records = prefs.getStringList(attendanceKey) ?? [];

    records.add(jsonEncode(attendance.toJson()));

    await prefs.setStringList(attendanceKey, records);
  }

  Future<List<AttendanceModel>> getAttendanceList() async {
    final prefs = await SharedPreferences.getInstance();

    List<String> records = prefs.getStringList(attendanceKey) ?? [];

    return records
        .map((e) => AttendanceModel.fromJson(jsonDecode(e)))
        .toList();
  }
}