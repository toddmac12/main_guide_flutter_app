// ignore_for_file: camel_case_types

import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _myAppState();
  }
}

class _myAppState extends State<myApp> {
  var _questionindex = 0;
  var _totalscore = 0;

  void _resetquiz() {
    setState(() {
      _questionindex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;

    setState(() {
      _questionindex = _questionindex + 1;
    });
    print(_questionindex);
  }

  @override
  Widget build(BuildContext context) {
    final _questions = const [
      {
        'question': 'Whats your favourite color?',
        'answer': [
          {'text': 'Black', 'score': 10},
          {'text': 'Blue', 'score': 4},
          {'text': 'Red', 'score': 7},
          {'text': 'Green', 'score': 1},
        ]
      },
      {
        'question': 'Whats your favourite animal?',
        'answer': [
          {'text': 'Crocodile', 'score': 10},
          {'text': 'Lion', 'score': 8},
          {'text': 'Goat', 'score': 1},
          {'text': 'Horse', 'score': 3},
        ]
      },
      {
        'question': 'Whats your favourite number?',
        'answer': [
          {'text': '10', 'score': 10},
          {'text': '8', 'score': 8},
          {'text': '1', 'score': 1},
          {'text': '3', 'score': 3},
        ]
      },
    ];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('First App'),
          ),
          body: _questionindex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionindex: _questionindex,
                  questions: _questions,
                )
              : Result(_totalscore, _resetquiz)),
    );
  }
}
