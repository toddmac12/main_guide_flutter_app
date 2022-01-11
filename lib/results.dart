// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final Function resetter;

  Result(this.resultscore, this.resetter);

  String get resultphrase {
    String result;
    if (resultscore <= 8) {
      result = 'You are awesome and innocent!';
    } else if (resultscore <= 12) {
      result = 'Pretty likeable!';
    } else if (resultscore <= 16) {
      result = 'You are ... strange?!';
    } else {
      result = 'You are so bad!';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          resultphrase,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        FlatButton(
          onPressed: resetter,
          child: Text('Restart Quiz'),
          textColor: Colors.blue,
        )
      ],
    );
  }
}
