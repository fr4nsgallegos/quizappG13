import 'package:quizappg13/models/question_model.dart';

class QuizBrain {
  int questionIndex = 0;
  bool isFinished = false;

  List<QuestionModel> questionList = [
    QuestionModel(question: "¿El hombre llego a la luna?", answer: true),
    QuestionModel(question: "¿Has almorzado hoy?", answer: false),
    QuestionModel(question: "Saliste ayer?", answer: false),
    QuestionModel(question: "¿Has desayunado?", answer: true),
    QuestionModel(question: "Sientes frio", answer: false),
  ];

  String getQuestionText() {
    return questionList[questionIndex].question;
  }

  bool getQuestionAnswer() {
    return questionList[questionIndex].answer;
  }

  void nextQuestion() {
    if (questionIndex < questionList.length - 1) {
      questionIndex++;
    } else {
      isFinished = true;
    }
  }

  bool isFinishedFunc() {
    return isFinished;
  }

  void restarQuizz() {
    questionIndex = 0;
    isFinished = false;
  }
}
