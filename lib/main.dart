import 'package:first_app/results.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import 'results.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    final _questions = const [
      {
        'question': 'What is your favourite color?',
        'answer': [
          {'text': 'Black', 'score': 10},
          {'text': 'Blue', 'score': 4},
          {'text': 'Red', 'score': 7},
          {'text': 'Green', 'score': 1},
        ]
      },
      {
        'question': 'What is your favourite animal?',
        'answer': [
          {'text': 'Crocodile', 'score': 10},
          {'text': 'Lion', 'score': 8},
          {'text': 'Goat', 'score': 1},
          {'text': 'Horse', 'score': 3},
        ]
      },
      {
        'question': 'What is your favourite number?',
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
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
