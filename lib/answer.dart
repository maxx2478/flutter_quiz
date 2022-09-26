import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  late final Function selectionHandler;
  final String answerText;
  Answer(this.selectionHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.cyan,),
        onPressed: () {selectionHandler();},
        child: Text(answerText, style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
