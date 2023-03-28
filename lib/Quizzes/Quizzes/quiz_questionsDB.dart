import 'package:artifact/Quizzes/QuestionSemantics/multiple_choice_question.dart';

import '../QuestionSemantics/TF_question.dart';
import '../QuestionSemantics/quiz_question.dart';

class QuestionsDB {
  static List<QuizQuestion> quiz1 = [];

  static List<QuizQuestion> quiz1Questions() {
    if (quiz1.isEmpty) {
      quiz1 = [
        //Initialize Questions Here
        MCQuestion(question: 'Choose A', correctAnswer: 'A', otherAnswers: ['B','C','D']),
        MCQuestion(question: 'Choose B', correctAnswer: 'B', otherAnswers: ['B','C','D']),
        TFQuestion(question: 'Choose True', correctAnswer: 'True'),
      ];
    }
    return quiz1;
  }
}