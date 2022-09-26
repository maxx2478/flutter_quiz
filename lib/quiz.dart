import 'package:flutter/cupertino.dart';
import 'package:fluuter_quiz_app/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final Function answerHandler;
  var listOfQuestions;
  final int questionIndex;

  Quiz(
      {required this.listOfQuestions,
      required this.answerHandler,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question((listOfQuestions[questionIndex]['questionText']).toString()),
        ...(listOfQuestions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) => Answer(()=>answerHandler(answer['score']), answer['text'].toString()))
            .toList(growable: true)
      ],
    );
  }
}
