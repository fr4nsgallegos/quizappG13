import 'package:flutter/material.dart';
import 'package:quizappg13/main.dart';
import 'package:quizappg13/quiz_brain.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuizBrain quizBrain = QuizBrain();
  List<Widget> score = [];
  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    // CUANDO LA RESPUESTA ES CORRECTA
    if (correctAnswer == userAnswer) {
      score.add(itemScore((quizBrain.questionIndex + 1).toString(), true));
      print(("La respuesta es correcta"));
    } else {
      // CUANDO LA RESPUES ES INCORRECTA
      score.add(itemScore((quizBrain.questionIndex + 1).toString(), false));
      print("INCORRECTO! ");
    }

    if (quizBrain.isFinishedFunc()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.warning, color: Colors.orange),
                Text("Alerta"),
              ],
            ),
            content: Text("Has llegado al final del formulario"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar"),
              ),
              ElevatedButton(
                onPressed: () {
                  quizBrain.restarQuizz();
                  Navigator.pop(context);
                  score.clear();
                  setState(() {});
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      print("El cuestionario ha terminado");
      return;
    }
    quizBrain.nextQuestion();
    setState(() {});
  }

  Widget itemScore(String numerQuestion, bool isCorrect) {
    return Row(
      children: [
        Text("$numerQuestion:", style: TextStyle(color: Colors.white)),
        Icon(
          isCorrect ? Icons.check : Icons.close,
          color: isCorrect ? Colors.greenAccent : Colors.redAccent,
        ),
      ],
    );
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
                    "${quizBrain.questionIndex + 1}.  ${quizBrain.getQuestionText()}",
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
              Row(mainAxisAlignment: MainAxisAlignment.center, children: score),
            ],
          ),
        ),
      ),
    );
  }
}
