import 'package:flutter/material.dart';
import 'generate_qr_screen.dart';

class AttendanceSessionScreen extends StatefulWidget {
  final String courseCode;
  final String section;
  final String duration;

  const AttendanceSessionScreen({
    super.key,
    required this.courseCode,
    required this.section,
    required this.duration,
  });

  @override
  State<AttendanceSessionScreen> createState() =>
      _AttendanceSessionScreenState();
}

class _AttendanceSessionScreenState extends State<AttendanceSessionScreen> {
  late final String sessionId;

  @override
  void initState() {
    super.initState();
    sessionId = generateSessionId();
  }

  String generateSessionId() {
    final now = DateTime.now();

    return "${widget.courseCode.replaceAll(' ', '')}-"
        "${widget.section.toUpperCase()}-"
        "${now.year}"
        "${now.month.toString().padLeft(2, '0')}"
        "${now.day.toString().padLeft(2, '0')}-"
        "${now.hour.toString().padLeft(2, '0')}"
        "${now.minute.toString().padLeft(2, '0')}"
        "${now.second.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance Session"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.menu_book),
                      title: const Text("Course"),
                      subtitle: Text(widget.courseCode),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.groups),
                      title: const Text("Section"),
                      subtitle: Text(widget.section),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.timer),
                      title: const Text("Duration"),
                      subtitle: Text(widget.duration),
                    ),

                    const Divider(),

                    const ListTile(
                      leading: Icon(Icons.circle, color: Colors.green),
                      title: Text("Status"),
                      subtitle: Text("Active"),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.numbers),
                      title: const Text("Session ID"),
                      subtitle: Text(sessionId),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GenerateQrScreen(
                        sessionId: sessionId,
                        courseCode: widget.courseCode,
                        section: widget.section,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.qr_code),
                label: const Text(
                  "Generate QR",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.stop_circle),
                label: const Text(
                  "End Session",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
