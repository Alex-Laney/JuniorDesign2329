import 'package:artifact/Quizzes/QuestionSemantics/multiple_choice_question.dart';

import '../QuestionSemantics/TF_question.dart';
import '../QuestionSemantics/quiz_question.dart';

class QuestionsDB {
  static List<QuizQuestion> quiz1 = [];
  static List<QuizQuestion> quiz2 = [];

  static List<QuizQuestion> quiz1Questions() {
    if (quiz1.isEmpty) {
      quiz1 = [
        //Initialize Questions Here
        MCQuestion(question: 'Where did Bach study music under Georg Böhm?',
            correctAnswer: ' St. Michael\'s School in Lüneburg',
            otherAnswers: ['Weimar','Anhalt-Köthen','Leipzig']),
        MCQuestion(question: "What was Bach's position in Leipzig, where he spent the remainder of his life?",
            correctAnswer: 'Director of music at St. Thomas Church and School',
            otherAnswers: ['Court musician','Chamber musician','Court organist']),
        TFQuestion(question: 'Was Beethoven still able to compose music even after losing his hearing?', correctAnswer: 'True'),
        MCQuestion(question: 'Which of Beethoven\'s works includes the famous "Ode to Joy" melody?',
            correctAnswer: 'Ninth Symphony',
            otherAnswers: ['Moonlight Sonata','Fifth Symphony','Piano Trios']),
        MCQuestion(question: 'At what age did Beethoven begin composing his own music?',
            correctAnswer: '8 years old',
            otherAnswers: ['16 years old','12 years old','17 years old']),
        MCQuestion(question: 'What was the name of the opera Mozart composed for the National Theater in Vienna?',
            correctAnswer: 'Idomeneo',
            otherAnswers: ['The Marriage of Figaro','Don Giovanni','The Magic Flute']),
        MCQuestion(question: 'What was the profession of Mozart\'s father?',
            correctAnswer: 'Musician and composer',
            otherAnswers: ['Painter','Sculptor','Writer']),
      ];
    }
    return quiz1;
  }
  static List<QuizQuestion> quiz2Questions() {
    if (quiz2.isEmpty) {
      quiz2 = [
        MCQuestion(question: 'Who wrote Für Elise?',
            correctAnswer: 'Ludwig van Beethoven',
            otherAnswers: ['Johann Sebastian Bach', 'Franz Schubert', 'Wolfgang Amadeus Mozart']),
        MCQuestion(
            question: "What is the original name of Moonlight Sonata?",
            correctAnswer: 'Piano Sonata No. 14',
            otherAnswers: [
              'Sonata Pathétique',
              'Sonata 1 in F Minor Allegro',
              'Für Elise'
            ]),
        TFQuestion(
            question: 'Pathétique in Sonata Pathétique means "pathetic"',
            correctAnswer: 'True'),
        MCQuestion(
            question: 'What is the English translation of "Für Elise"?',
            correctAnswer: 'For Elise',
            otherAnswers: [
              'For Elizabeth',
              'The Swan',
              'Piano Trios'
            ]),
        MCQuestion(
            question: 'In which musical period was "Für Elise" written?',
            correctAnswer: 'Romantic Period',
            otherAnswers: ['Contemporary Period', 'Classical Period', 'Baroque Period']),
        MCQuestion(
            question: 'What musical structure does Für Elise utilize?',
            correctAnswer: 'Rondo',
            otherAnswers: [
              'Sonata',
              'Fugue',
              'Aria'
            ]),
      ];
    }
    return quiz2;
  }
}