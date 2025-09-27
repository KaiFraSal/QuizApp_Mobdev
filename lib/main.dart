import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      "question": "What is the capital of the Philippines?",
      "answers": ["Cebu", "Manila", "Davao", "Quezon City"],
      "correct": "Manila",
    },
    {
      "question": "Which programming language does Flutter use?",
      "answers": ["Java", "Kotlin", "Dart", "Swift"],
      "correct": "Dart",
    },
    {
      "question": "Who created Flutter?",
      "answers": ["Apple", "Microsoft", "Facebook", "Google"],
      "correct": "Google",
    },
    {
      "question": "Who created Flutter?",
      "answers": ["Apple", "Microsoft", "Facebook", "Google"],
      "correct": "Google",
    },
    {
      "question": "Who created Flutter?",
      "answers": ["Apple", "Microsoft", "Facebook", "Google"],
      "correct": "Google",
    },
    {
      "question": "Who created Flutter?",
      "answers": ["Apple", "Microsoft", "Facebook", "Google"],
      "correct": "Google",
    },
    {
      "question": "Who created Flutter?",
      "answers": ["Apple", "Microsoft", "Facebook", "Google"],
      "correct": "Google",
    },
    {
      "question": "Who created Flutter?",
      "answers": ["Apple", "Microsoft", "Facebook", "Google"],
      "correct": "Google",
    },
    {
      "question": "Who created Flutter?",
      "answers": ["Apple", "Microsoft", "Facebook", "Google"],
      "correct": "Google",
    },
    {
      "question": "Who is the cutest pink girl?",
      "answers": ["Elysia", "Microsoft", "Facebook", "Google"],
      "correct": "Elysia",
    },
  ];

  void _answerQuestion(String selectedAnswer) {
    if (selectedAnswer == _questions[_currentQuestionIndex]["correct"]) {
      _score++;
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      // Navigate to Result Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(score: _score, total: _questions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentQ = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Question ${_currentQuestionIndex + 1}/${_questions.length}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              currentQ["question"],
              style: const TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQ["answers"].map<Widget>((answer) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _answerQuestion(answer),
                  child: Text(answer, style: const TextStyle(fontSize: 18)),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  const ResultScreen({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    final String msg = score >= 5 ? 'You passed! :)' : 'You failed :(';
    return Scaffold(
      appBar: AppBar(title: const Text("Result")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Score: $score / $total",
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              msg,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizScreen()),
                );
              },
              child: const Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
