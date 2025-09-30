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

String? _select;

Color? test(String? color){
  if(color == 'girl'){
    return Colors.pink[200];
  }
  else{
    return Colors.blue[200];
  }
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      "question": "Who is the main character of Dragon Ball?",
      "answers": ["Son Goku", "Son Gohan", "Vegeta", "Piccolo"],
      "correct": "Son Goku",
    },
    {
      "question": "From what alien race is Goku from?",
      "answers": ["Humans", "Saiyans", "Majins", "Namekians"],
      "correct": "Saiyans",
    },
    {
      "question": "What transformation did Goku achieve on Namek?",
      "answers": ["Super Saiyan", "Ultra Saiyan", "Mega Saiyan", "Hyper Saiyan"],
      "correct": "Super Saiyan",
    },
    {
      "question": "What is the multiplier for Super Saiyan?",
      "answers": ["x50", "x20", "x25", "x10"],
      "correct": "x50",
    },
    {
      "question": "What was Goku's power level on Namek as a Super Saiyan?",
      "answers": ["3 million", "120 million", "150 million", "110 million"],
      "correct": "150 million",
    },
    {
      "question": "What Super Saiyan grade was Goku using against Cell?",
      "answers": ["Grade 4", "Grade 3", "Grade 2", "Grade 5"],
      "correct": "Grade 4",
    },
    {
      "question": "The fight between Goku and Beerus threatened to destroy the ___?",
      "answers": ["Planet", "Universe", "Galaxy", "Solar System"],
      "correct": "Universe",
    },
    {
      "question": "Goku achieved ___ in the Tournament of Power?",
      "answers": ["Ultra Instinct", "Super Instinct", "Quick Instinct", "Fast Instinct"],
      "correct": "Ultra Instinct",
    },
    {
      "question": "Which Dragon Ball holds significant importance to Goku?",
      "answers": ["Three-star Dragon Ball", "Two-star Dragon Ball", "Five-star Dragon Ball", "Four-star Dragon Ball"],
      "correct": "Four-star Dragon Ball",
    },
    {
      "question": "Fill in the blanks: I am the ___ Son Goku!",
      "answers": ["Super Saiyan", "Dragon Ball Z", "Dragon Ball Super", "Dragon Ball"],
      "correct": "Super Saiyan",
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
    if (_select == null) {
      return Container(
        decoration: const BoxDecoration(
          gradient:  LinearGradient(
            begin: Alignment.topCenter,
            end:  Alignment.bottomCenter,
            colors: [Color(0xffFFBF00), Color(0xffF85B1A)]
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              "Choose:",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
            backgroundColor: Color(0xff072083),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Are you a boy or a girl?",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[200],
                        minimumSize: const Size(180, 48),
                      ),
                      onPressed: () => setState(() => _select = 'boy'),
                      child: const Text("Boy", style: TextStyle(fontSize: 18)),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[200],
                        minimumSize: const Size(180, 48),
                      ),
                      onPressed: () => setState(() => _select = 'girl'),
                      child: const Text("Girl", style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );
    }

    var currentQ = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff072083),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffFFBF00), Color(0xffF85B1A)]
          )
        ),
        child: Padding(
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: test(_select)
                    ),
                    onPressed: () => _answerQuestion(answer),
                    child: Text(answer, style: const TextStyle(fontSize: 18)),
                  ),
                );
              }).toList(),
              const SizedBox(height: 30),
            ],
          ),
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
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffFFBF00), Color(0xffF85B1A)]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            "Result",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff072083),
        ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: test(_select)
                ),
                onPressed: () {
                  _select = null;
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
      ),
    );
  }
}