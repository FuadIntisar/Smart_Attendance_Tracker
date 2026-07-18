import 'package:flutter/material.dart';

class AttendanceSuccessScreen extends StatelessWidget {
  final String qrData;

  const AttendanceSuccessScreen({
    super.key,
    required this.qrData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance Status"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),

              const SizedBox(height: 20),

              const Text(
                "Attendance Submitted",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Your attendance has been recorded successfully.",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.qr_code),
                  title: const Text("Scanned QR"),
                  subtitle: Text(qrData),
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text("Back to Dashboard"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}