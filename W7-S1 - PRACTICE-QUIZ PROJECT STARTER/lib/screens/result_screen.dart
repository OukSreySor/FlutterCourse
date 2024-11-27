import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7-S1 - PRACTICE-QUIZ PROJECT STARTER/lib/model/submission.dart';
import 'package:flutter_workspace/W7-S1%20-%20PRACTICE-QUIZ%20PROJECT%20STARTER/lib/model/quiz.dart';
import 'package:flutter_workspace/W7-S1 - PRACTICE-QUIZ PROJECT STARTER/lib/widgets/app_button.dart';
class ResultScreen extends StatelessWidget {
  const ResultScreen({required this.submission, required this.onRestart, super.key});
  final Submission submission;
  final VoidCallback onRestart;
  
   
  @override
  Widget build(BuildContext context) {

    final int score = submission.getScore();
    final List<Question> questions = submission.quiz.questions;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answer $score on ${questions.length}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ), 
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ...questions.asMap().entries.map((entry) {
              final int questionIndex = entry.key + 1;
              final Question question = entry.value;
              final Answer? userAnswer = submission.getAnswerFor(question);
              final bool isCorrect = userAnswer?.isCorrect() ?? false;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //question number and title
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: isCorrect ? Colors.green: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '$questionIndex',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            question.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    //display possible answer
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: question.possibleAnswers.map((answer) {
                        bool isUserAnswer = (answer == userAnswer?.userAnswer); // check if current answer being displayed matches the answer the user submitted
                        bool isCorrectAnswer = (answer == question.goodAnswer); // check if the answer currently being displayed matches the correct answer

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              if (isCorrectAnswer)
                              const Icon(Icons.check, color: Colors.black),
                              const SizedBox(width: 8),
                              if (!isCorrectAnswer)
                              const SizedBox(width: 24),
                              Text(
                                answer,
                                style: TextStyle(
                                  color: isUserAnswer? (isCorrect ? Colors.green: Colors.red) : Colors.black,
                                )
                              )
                            ],
                          )
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              );
            }),
            AppButton(
              "Restart Quiz",
              onTap: onRestart,
              icon: Icons.restart_alt,
            )
          ],
        ),
      ),
    );
  }
}
 