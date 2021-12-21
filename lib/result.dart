// ignore_for_file: deprecated_member_use, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetQuizHandler;

  Result(this.score, this.resetQuizHandler);

// Using getter to dynamically set values for resultPhrase.
  String get resultPhrase {
    String resultText;
    if (score == 3) {
      resultText = 'Prodigy!';
    } else if (score == 2) {
      resultText = 'Intelligent!';
    } else if (score == 1) {
      resultText = 'Good!';
    } else {
      resultText = 'Loser!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(fontSize: 28),
          ),
        ),
        Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            child: Center(
              child: Text(
                score.toString(),
                style: TextStyle(
                  color: Color.fromRGBO(100, 200, 45, 1),
                  fontSize: 40,
                  fontFamily: "Monospace",
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
        Container(
          child: ButtonTheme(
            minWidth: 180.0,
            height: 50,
            child: RaisedButton(
              child: Text(
                "Play Again",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: resetQuizHandler,
              color: Colors.blue,
            ),
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}