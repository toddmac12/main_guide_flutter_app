import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetter;

  Result(this.resultScore, this.resetter);

  String get resultPhrase {
    String result;
    if (resultScore <= 8) {
      result = 'You are awesome and innocent!';
    } else if (resultScore <= 12) {
      result = 'Pretty likeable!';
    } else if (resultScore <= 16) {
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
          resultPhrase,
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

