import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7-S1%20-%20PRACTICE-QUIZ%20PROJECT%20STARTER/lib/widgets/app_button.dart';

 class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({ required this.quizTitle, required this.onStart, super.key});
  final String quizTitle;
  final VoidCallback onStart;
   
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [ Image.asset('assets/w7-s1/quiz-logo.png'),
        const SizedBox(height: 20),
        Text(
            quizTitle,
            style: const TextStyle(
              fontSize: 30, 
              fontWeight: FontWeight.bold, 
              color: Colors.white,
            ),
          ),
        const SizedBox(height: 40),
        AppButton(
          "Start Quiz",
          onTap: onStart,
          icon: Icons.arrow_forward,
        )
      ]
    );
  }
}
 
