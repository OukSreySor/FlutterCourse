
import 'quiz.dart';
class Answer {
  final String userAnswer;
  final Question question;
  Answer({required this.userAnswer, required this.question});

  bool isCorrect() {
    return userAnswer == question.goodAnswer;
  }  

}
class Submission {
 
  final Quiz quiz;
  final List<Answer> answer;
  Submission({required this.quiz, required this.answer});

  int getScore() {
    int totalScore = 0;
    for (Answer userAnswer in answer) {
      if (userAnswer.isCorrect()) {
        totalScore++;
      }
    }
    return totalScore;
  }

  Answer? getAnswerFor(Question question) {
    for (Answer userAnswer in answer) {
      if (userAnswer.question == question) {
        return userAnswer;
      }
    }
    return null;
  }

  void addAnswer(Question question, String userAnswer) {
    /// Check if an answer already exists for the given question
    Answer? existingAnswer = getAnswerFor(question);

    if (existingAnswer != null) {
      // If an answer exists, update the user's answer for the question
      int index = answer.indexOf(existingAnswer);
      answer[index] = Answer(question: question, userAnswer: userAnswer);
    } else {
      // If no answer exists, add a new one
      answer.add(Answer(question: question, userAnswer: userAnswer));
    } 

  }
  // Remove all answers
  void removeAnswers() {
    answer.clear();
  }
}
// void main() {
//   Question q1 = const Question(
//       title: "Who is the best teacher?",
//       possibleAnswers: ["ronan", "hongly", 'leangsiv'],
//       goodAnswer: 'ronan');
//   Question q2 = const Question(
//       title: "Which color is the best?",
//       possibleAnswers: ["blue", "red", 'green'],
//       goodAnswer: 'red');
//   // Quiz
//   List<Question> myQuestions = [q1, q2];
//   Quiz myQuiz = Quiz(title: "Crazy Quizz", questions: myQuestions);
//   // User answers
//   Answer answer1 = Answer(question: q1, userAnswer: "ronan"); // Correct
//   Answer answer2 = Answer(question: q2, userAnswer: "green");    // Incorrect

//   // Submission
//   Submission submission = Submission(quiz: myQuiz, answer: [answer1, answer2]);

//   // Calculate and print the score
//   print("Score: ${submission.getScore()}"); 

//   // Add or update the user answers
//   submission.addAnswer(q2, "red"); 
//   submission.addAnswer(q1, "hongly"); 

//   // Print updated score
//   print("Updated Score: ${submission.getScore()}"); 

//   // Remove all answers
//   submission.removeAnswers();
//   print("Answers removed."); 

// }