import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7-S1%20-%20PRACTICE-QUIZ%20PROJECT%20STARTER/lib/model/quiz.dart';
import '../widgets/app_button.dart';
import '../model/submission.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({required this.quiz, required this.onComplete, required this.onFinish,  super.key});
  
  final Quiz quiz;
  final Function(Submission) onComplete;
  final VoidCallback onFinish; 
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}
class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  final List<Answer> userAnswers = [];
  String? selectedAnswer;

  void goToNextQuestion() {
    final currentQuestion = widget.quiz.questions[currentQuestionIndex];
    
    if (selectedAnswer != null) {
      userAnswers.add(Answer(userAnswer: selectedAnswer!, question: currentQuestion));
    } else {
      userAnswers.add(Answer(userAnswer: '', question: currentQuestion));
    }

    if (currentQuestionIndex < widget.quiz.questions.length - 1) {
      setState(() {
        currentQuestionIndex ++;
        // reset for next question
        selectedAnswer = null;
      });
    }else {
      
      widget.onComplete(Submission(quiz: widget.quiz, answer: userAnswers));
      widget.onFinish();
    }
  }
  void selectAnswer(String answer) {
    
    setState(() {
      selectedAnswer = answer;
      goToNextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {

    final Question currentQuestion = widget.quiz.questions[currentQuestionIndex]; 

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Text(
                  currentQuestion.title,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, 
                    ),
                ),  
                const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: currentQuestion.possibleAnswers.map((answer) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: ElevatedButton(
                            onPressed: () => selectAnswer(answer), 
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                                  answer,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    ),
                                ),
                            ),
                          );
                        }).toList(),
                    ),
                    const SizedBox(height: 16),  
                    AppButton(
                      'Next Question', 
                      onTap: goToNextQuestion, 
                    ),
              ],
            ),
          ),  
        ),
      )
    );
  }   
}
