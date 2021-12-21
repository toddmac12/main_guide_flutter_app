// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';

import './result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _indexNum = 0, _score = 0;

  var _questionAnswers = [
    {
      "quesText": "What is the capital of India ?",
      "ansText": {"Mumbai": 0, "New Delhi": 1, "Bengaluru": 0}
    },
    {
      "quesText": "Who is the captain of Indian Cricket Team ?",
      "ansText": {"MS Dhoni": 1, "Sachin Tendulkar": 0, "Dinesh Kartik": 0}
    },
    {
      "quesText": "What is India's national bird ?",
      "ansText": {"Swan": 0, "Peacock": 1, "Eagle": 0},
    },
    {
      "quesText": "Do you want to become a Software Engineer at GoOgle ?",
      "ansText": {"Go to": 0, "AlgoExpert": 1, ".io": 0},
    },
    {
      "quesText": "How many times do pigeons fart in a day ?",
      "ansText": {"Less than my wife": 0, "More than you do": 1, "Zero": 0},
    },
    {
      "quesText": "Where is America ?",
      "ansText": {"Earth": 0, "Moon": 1, "Mars": 0},
    },
  ];

  void resetQuiz() {
    setState(() {
      _indexNum = 0;
      _score = 0;
    });
  }

  void answerQuestion(String indx) {
    setState(() {
      if (_indexNum < _questionAnswers.length)
        _score += (_questionAnswers[_indexNum]["ansText"] as Map)[indx];

      _indexNum++;
    });

    if (_indexNum > _questionAnswers.length)
      print("Answer Chosen !");
    else
      print("Quiz Over!");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: _indexNum < _questionAnswers.length
            ? Quiz(_questionAnswers, answerQuestion, _indexNum)
            : Result(_score, resetQuiz),
      ),
    );
  }
}

//This code will work more efficiently. Thank me later
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}
