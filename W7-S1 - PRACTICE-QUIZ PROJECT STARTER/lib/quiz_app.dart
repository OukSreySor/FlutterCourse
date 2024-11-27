import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7-S1%20-%20PRACTICE-QUIZ%20PROJECT%20STARTER/lib/model/quiz.dart';
import 'package:flutter_workspace/W7-S1%20-%20PRACTICE-QUIZ%20PROJECT%20STARTER/lib/model/submission.dart';
import 'package:flutter_workspace/W7-S1%20-%20PRACTICE-QUIZ%20PROJECT%20STARTER/lib/screens/question_screen.dart';
import 'package:flutter_workspace/W7-S1%20-%20PRACTICE-QUIZ%20PROJECT%20STARTER/lib/screens/result_screen.dart';
import 'package:flutter_workspace/W7-S1%20-%20PRACTICE-QUIZ%20PROJECT%20STARTER/lib/screens/welcome_screen.dart';

Color appColor = Colors.blue[500] as Color;
enum QuizState {
  notStarted, 
  started,
  finished,
}
class QuizApp extends StatefulWidget {
  const QuizApp({required this.quiz, super.key});

  final Quiz quiz;
  
  @override
  State<QuizApp> createState() => _QuizAppState();
}
class _QuizAppState extends State<QuizApp> {

  QuizState _currentScreen = QuizState.notStarted;
  late Submission _submission = Submission(quiz: widget.quiz, answer: []);
  
  
  void _changeScreen(QuizState quizState) {
    setState(() {
      _currentScreen = quizState;
    });
  }
  void _onComplete(Submission submission) {
    setState(() {
      _submission = submission;
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget displayedScreen;

    switch (_currentScreen) {
      case QuizState.notStarted:
        displayedScreen = WelcomeScreen(quizTitle: widget.quiz.title, onStart: () => _changeScreen(QuizState.started));
        break;
      case QuizState.started:
        displayedScreen = QuestionScreen(
          quiz: widget.quiz, 
          onComplete: _onComplete,
          onFinish: () => _changeScreen(QuizState.finished));
        break;
      case QuizState.finished:
        displayedScreen = ResultScreen(submission: _submission, onRestart: () => _changeScreen(QuizState.notStarted));
        break;
      
      default:
        displayedScreen = const Center(child: Text("Unknown Screen"),);
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(child: displayedScreen,)
      ),
    );
  }
  
}
