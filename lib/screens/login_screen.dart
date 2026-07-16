import 'package:flutter/material.dart';
import 'teacher/teacher_home_screen.dart';
import 'student/student_home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    final id = emailController.text.trim();
    final password = passwordController.text.trim();

    // Demo Teacher Login
    if (id == "teacher" && password == "1234") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TeacherHomeScreen(),
        ),
      );
    }

    // Demo Student Login
    else if (id == "student" && password == "1234") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const StudentHomeScreen(),
        ),
      );
    }

    // Empty Fields
    else if (id.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enter ID and Password"),
        ),
      );
    }

    // Invalid Login
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid ID or Password"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "ID",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: login,
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}