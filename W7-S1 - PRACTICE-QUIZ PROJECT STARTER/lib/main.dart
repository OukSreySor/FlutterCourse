import 'package:flutter/material.dart';
import 'quiz_app.dart';
import 'model/quiz.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Question> questions = [ 
      const Question(
        title: "Who is the best teacher?",
        possibleAnswers: ["ronan", "hongly", 'leangsiv'],
        goodAnswer: 'ronan'),
      const Question(
        title: "Which color is the best?",
        possibleAnswers: ["blue", "red", 'green'],
        goodAnswer: 'red'
      ),
    ];
    final Quiz quiz = Quiz(title: "Crazy Quiz", questions: questions);
    return MaterialApp(
      home: QuizApp(quiz: quiz),
    );
  }
}
