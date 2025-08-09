import 'package:flutter/material.dart';
import 'package:quizappg13/quiz_brain.dart';

class HomePage extends StatelessWidget {
  QuizBrain quizBrain = QuizBrain();

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    // CUANDO LA RESPUESTA ES CORRECTA
    if (correctAnswer == userAnswer) {
      print(("La respuesta es correcta"));
    } else {
      // CUANDO LA RESPUES ES INCORRECTA
      print("INCORRECTO! ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2F3243),
        appBar: AppBar(
          elevation: 15,

          backgroundColor: Color(0xff2F3243),
          title: Text("QuizzApp"),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    "${quizBrain.getQuestionText()}",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Colors.greenAccent,
                    minWidth: double.infinity,
                    onPressed: () {
                      checkAnswer(true);
                    },
                    child: Text("Verdadero"),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Colors.redAccent,
                    minWidth: double.infinity,
                    onPressed: () {
                      checkAnswer(false);
                    },
                    child: Text("Falso"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
