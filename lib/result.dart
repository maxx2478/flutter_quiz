import 'dart:ffi';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final VoidCallback resetHandler;

  Result(this.finalScore, this.resetHandler);

  String get resultPhrase {
    var resultText;
    if (finalScore <= 9) {
      resultText = "you are juist awesome 2 time";
    } else
      resultText = "you are juist awesome 4 time";

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(50),
        child: Column(
          children: [
            Text("$resultPhrase"),
            ElevatedButton(onPressed: resetHandler,
                child: Text("Reset"))
          ],
        ),
      ),
    );
  }
}
