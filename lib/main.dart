import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

/* _ syntax ..converts public class to private class
can only be used MyApp class...class located on other files cannot use it*/
class _MyAppState extends State<MyApp> {
  //_ syntax private property
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'what is your favourite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'green', 'score': 3},
        {'text': 'white', 'score': 1},
      ]
    },
    {
      'questionText': 'what is your favourite animal?',
      'answers': [
        {'text': 'deer', 'score': 10},
        {'text': 'lion', 'score': 5},
        {'text': 'snake', 'score': 3},
        {'text': 'bird', 'score': 1},
      ]
    },
    {
      'questionText': 'what is your favourite car?',
      'answers': [
        {'text': 'bmw', 'score': 10},
        {'text': 'ferrari', 'score': 5},
        {'text': 'honda', 'score': 3},
        {'text': 'plane', 'score': 1},
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _AnswerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      print('setState()  called!');
      _questionIndex = (_questionIndex + 1);
    });

    print('AnswerQuestion()  called!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('My First App')),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _AnswerQuestion,
              questionIndex: _questionIndex,
              questions: _questions)
          : Result(_totalScore, _resetQuiz),
    ));
  }
}