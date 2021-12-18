import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get ResultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You did it ' + resultScore.toString();
    } else if (resultScore <= 12) {
      resultText = 'You did it ' + resultScore.toString();
    } else {
      resultText = 'You did it ';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            ResultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text('Restart Quiz!',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}