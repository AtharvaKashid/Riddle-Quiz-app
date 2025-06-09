// lib/quiz_screen.dart

import 'package:flutter/material.dart';
import 'package:quiz_app/riddle_data.dart';
import 'package:quiz_app/result_screen.dart'; // Import the ResultScreen
import 'dart:math'; // For shuffling

class QuizScreen extends StatefulWidget {
  final String difficulty;

  const QuizScreen({super.key, required this.difficulty});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Riddle> _riddlesForQuiz;
  int _currentRiddleIndex = 0;
  bool _showAnswer = false;
  int _correctAnswers = 0; // To track score

  @override
  void initState() {
    super.initState();
    _filterAndShuffleRiddles();
  }

  void _filterAndShuffleRiddles() {
    _riddlesForQuiz = allRiddles
        .where((riddle) => riddle.difficulty == widget.difficulty)
        .toList();
    _riddlesForQuiz.shuffle(Random()); // Shuffle the selected riddles
    _riddlesForQuiz = _riddlesForQuiz.take(5).toList(); // Take only 5 riddles
  }

  void _revealAnswer() {
    setState(() {
      _showAnswer = true;
    });
  }

  void _nextRiddle() {
    setState(() {
      if (_currentRiddleIndex < _riddlesForQuiz.length - 1) {
        _currentRiddleIndex++;
        _showAnswer = false; // Reset for the next riddle
      } else {
        // Quiz completed, navigate to result screen
        Navigator.pushReplacement( // Use pushReplacement to prevent going back to quiz
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              score: _correctAnswers,
              totalRiddles: _riddlesForQuiz.length,
            ),
          ),
        );
      }
    });
  }

  void _markAnswer(bool isCorrect) {
    if (isCorrect) {
      _correctAnswers++;
    }
    _nextRiddle(); // Move to the next riddle after marking
  }

  @override
  Widget build(BuildContext context) {
    if (_riddlesForQuiz.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Riddle Quiz')),
        body: const Center(
          child: Text('No riddles available for this difficulty.'),
        ),
      );
    }

    final currentRiddle = _riddlesForQuiz[_currentRiddleIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.difficulty} Riddles'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Riddle ${_currentRiddleIndex + 1} of ${_riddlesForQuiz.length}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      currentRiddle.question,
                      style: const TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    if (_showAnswer)
                      Column(
                        children: [
                          const Text(
                            'Answer:',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            currentRiddle.answer,
                            style: const TextStyle(fontSize: 20, color: Colors.black87),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    else
                      ElevatedButton(
                        onPressed: _revealAnswer,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Reveal Answer'),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            if (_showAnswer) // Show these buttons only after answer is revealed
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () => _markAnswer(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                    ),
                    child: const Text('I got it right!', style: TextStyle(fontSize: 18)),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () => _markAnswer(false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                    ),
                    child: const Text('I got it wrong!', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            const Spacer(), // Pushes content to the top
            // Removed the "Next Riddle" button as it's now handled by _markAnswer
          ],
        ),
      ),
    );
  }
}