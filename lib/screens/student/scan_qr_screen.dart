import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'attendance_success_screen.dart';
import '../../models/attendance_model.dart';
import '../../services/attendance_service.dart';

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({super.key});

  @override
  State<ScanQrScreen> createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  bool isScanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan QR Code"), centerTitle: true),
      body: MobileScanner(
        onDetect: (BarcodeCapture capture) async {
          if (isScanned) return;

          final List<Barcode> barcodes = capture.barcodes;
          if (barcodes.isEmpty) return;

          final String qrData = barcodes.first.rawValue ?? "No Data";

          setState(() {
            isScanned = true;
          });

          final attendance = AttendanceModel(
            studentId: "2025331001",
            course: "SWE-101",
            section: "A",
            sessionId: qrData,
            date: DateTime.now().toString().split(" ")[0],
            time: TimeOfDay.now().format(context),
          );

          await AttendanceService().saveAttendance(attendance);

          if (!mounted) return;

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => AttendanceSuccessScreen(qrData: qrData),
            ),
          );
        },
      ),
    );
  }
}
