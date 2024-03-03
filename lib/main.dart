// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'quiz_train.dart'; // Assuming quiz_brain.dart contains your QuizTrain class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _QuizAppState createState() => _QuizAppState();
}

int totalCorrectAnswers = 0;

class _QuizAppState extends State<QuizApp> {
  QuizTrain quizTrain = QuizTrain();
  List<Icon> scores = [];

  ElevatedButton buildButton({
    required String value,
    required Color color,
    required int optionIndex,
  }) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
      ),
      onPressed: () {
        setState(() {
          if (scores.length <= quizTrain.questionNumber) {
            int? correctOptionIndex = quizTrain.getCorrectOptionIndex();
            if (correctOptionIndex != null && correctOptionIndex == optionIndex) {
              totalCorrectAnswers++;
              scores.add(
                Icon(
                  Icons.check,
                  color: Color.fromARGB(255, 183, 204, 184),
                ),
              );
            } else {
              scores.add(
                Icon(
                  Icons.clear,
                  color: Color.fromARGB(255, 228, 168, 163),
                ),
              );
            }
            quizTrain.nextQuestion();
          } else {
            Alert(
              context: context,
              title: "QuizApp",
              desc: "You have reached the end. Your score is $totalCorrectAnswers",
            ).show();
            quizTrain.questionNumber = 0;
            totalCorrectAnswers = 0;
            scores.clear();
          }
        });
      },
      child: Text(
        value,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.question_answer),
        title: Text("Quiz App"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  quizTrain.getQuestion()!,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            for (int i = 0; i < quizTrain.getOptions()!.length; i++)
              buildButton(
                value: quizTrain.getOptions()![i],
                color: const Color.fromARGB(255, 220, 252, 237),
                optionIndex: i,
              ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: scores,
            ),
          ],
        ),
      ),
    );
  }
}
