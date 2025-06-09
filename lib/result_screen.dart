// lib/result_screen.dart

import 'package:flutter/material.dart';
import 'package:quiz_app/home_screen.dart'; // Import HomeScreen to navigate back

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalRiddles;

  const ResultScreen({super.key, required this.score, required this.totalRiddles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result',style: TextStyle(fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: false, // Hide back button
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quiz Completed!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
            const SizedBox(height: 30),
            Text(
              'You scored:',
              style: TextStyle(fontSize: 24, color: Colors.grey[700]),
            ),
            Text(
              '$score / $totalRiddles',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil( // Navigate back to home and remove all previous routes
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                      (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              child: const Text('Play Again'),
            ),
          ],
        ),
      ),
    );
  }
}