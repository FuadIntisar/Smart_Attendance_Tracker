import 'package:flutter/material.dart';

class AttendanceSessionScreen extends StatelessWidget {
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
                      subtitle: Text(courseCode),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.groups),
                      title: const Text("Section"),
                      subtitle: Text(section),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.timer),
                      title: const Text("Duration"),
                      subtitle: Text(duration),
                    ),

                    const Divider(),

                    const ListTile(
                      leading: Icon(
                        Icons.circle,
                        color: Colors.green,
                      ),
                      title: Text("Status"),
                      subtitle: Text("Active"),
                    ),

                    const Divider(),

                    const ListTile(
                      leading: Icon(Icons.numbers),
                      title: Text("Session ID"),
                      subtitle: Text("TEMP-001"),
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
                onPressed: () {},
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