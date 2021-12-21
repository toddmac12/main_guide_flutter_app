//Building a simple flutter application from scratch

import 'package:flutter/material.dart';
import 'package:revision_flutter_basics/quiz.dart';
import 'package:revision_flutter_basics/result.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'Which is the capital city of Nepal?',
      'answers': [
        {'text': 'Delhi', 'score': 0},
        {'text': 'Kathmandu', 'score': 10},
        {'text': 'Dhaka', 'score': 0},
        {'text': 'Bangkok', 'score': 0},
      ]
    },
    {
      'questionText': 'Who is the father of Computers?',
      'answers': [
        {'text': 'Albert Einstein', 'score': 0},
        {'text': 'Thomas A. Edition', 'score': 0},
        {'text': 'Charles Babbage', 'score': 10},
        {'text': 'Bijaya Shahi', 'score': 0},
      ]
    },
    {
      'questionText': 'What is our national Animal?',
      'answers': [
        {'text': 'Tiger', 'score': 0},
        {'text': 'Rhino', 'score': 0},
        {'text': 'Elephant', 'score': 0},
        {'text': 'Cow', 'score': 10},
      ]
    },
    {
      'questionText': 'Who united Nepal?',
      'answers': [
        {'text': 'Bhim Sumsher Rana', 'score': 0},
        {'text': 'Prithivi Narayan Shah', 'score': 10},
        {'text': 'Bala Bhadra Kuwar', 'score': 0},
        {'text': 'Jackie Chan', 'score': 0},
      ]
    },
  ];

  void _answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Quiz App'),
          centerTitle: true,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(answerQuestions : _answerQuestions, questions: _questions, questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}