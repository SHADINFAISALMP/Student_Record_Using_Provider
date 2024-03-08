import 'package:flutter/material.dart';
import 'package:sqflite_10/screen/homescreen.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using Future.delayed to wait for 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      // Navigating to the HomePage after the delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const HomeScreeen(), // Replace with your actual HomePage
        ),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/splash2.jpg',
              width: 350,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 70),
            const Text("STUDENT RECORD",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,letterSpacing: 12),),
          ],
        ),
      ),
    );
  }
}
