import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_quiz_app/question.dart';
import 'package:fluuter_quiz_app/quiz.dart';
import 'package:fluuter_quiz_app/result.dart';

import 'answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  final questions = [
    {
      'questionText': 'What is the name of your friend',
      'answers': [
        {'text': 'Akshay', 'score': 10},
        {'text': 'Harshad', 'score': 7},
        {'text': 'Mahesh', 'score': 9},
        {'text': 'Akshay', 'Ajay': 6}
      ]
    },
    {
      'questionText': 'What is hare krsna',
      'answers': [
        {'text': 'Mahamantra', 'score': 10},
        {'text': 'Mantra1', 'score': 7},
        {'text': 'Mantra', 'score': 9},
        {'text': 'Yoga', 'Ajay': 6}
      ]
    },
  ];

  var scoreTotal = 0;

  @override
  Widget build(BuildContext context) {

    void _resetQuiz() {
      setState(() {
        _questionIndex = 0;
        scoreTotal = 0;
      });
    }

    void _answerQuestion(int score) {
      scoreTotal += score;
      setState(() {
        _questionIndex = _questionIndex + 2;
      });

      if (_questionIndex < questions.length) {
        if (kDebugMode) {
          print("the new question avail for index $_questionIndex");
        }
      } else {
        if (kDebugMode) {
          print("No more questions for index $_questionIndex");
        }
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Quiz App")),
        body: _questionIndex < questions.length
            ? Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Quiz(
                    listOfQuestions: questions,
                    answerHandler: _answerQuestion,
                    questionIndex: _questionIndex))
            : Result(scoreTotal, _resetQuiz),
      ),
    );
  }
}
