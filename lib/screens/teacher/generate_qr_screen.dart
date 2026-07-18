import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrScreen extends StatelessWidget {
  final String sessionId;
  final String courseCode;
  final String section;

  const GenerateQrScreen({
    super.key,
    required this.sessionId,
    required this.courseCode,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    final String qrData = "Session:$sessionId\nCourse:$courseCode\nSection:$section";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance QR"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Scan this QR to mark attendance",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: QrImageView(
                    data: qrData,
                    version: QrVersions.auto,
                    size: 250,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              ListTile(
                leading: const Icon(Icons.menu_book),
                title: const Text("Course"),
                subtitle: Text(courseCode),
              ),

              ListTile(
                leading: const Icon(Icons.groups),
                title: const Text("Section"),
                subtitle: Text(section),
              ),

              ListTile(
                leading: const Icon(Icons.qr_code),
                title: const Text("Session ID"),
                subtitle: Text(sessionId),
              ),
            ],
          ),
        ),
      ),
    );
  }
}