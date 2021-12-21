import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase{
    var resultText = '';
    if(resultScore == 0){
      resultText = 'No answers matched!! Please Try Again!';
    }else if(resultScore == 10){
      resultText = 'You matched only one Answer, Please Try Again!';
    }else if (resultScore == 20){
      resultText = 'You matched only two answers, Study more!';
    }else if (resultScore == 30){
      resultText = 'You matched only three answers, You are good!';
    }else{
      resultText = 'You matched all the answers, Hurray!!!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
      width: double.infinity,
      child:  Column(
        children: [
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          RaisedButton(
            padding: EdgeInsets.all(10.0),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: resetQuiz,
            child: const Text(
              'Restart',
            ),
          )
        ],
      ),
    );

  }
}