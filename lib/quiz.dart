import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestions;
  final int questionIndex;
  final List<Map<String, Object>> questions;

  Quiz({
    @required this.answerQuestions,
    @required this.questions,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //mapping the question index of 'questionText' from var questions
        Question(questions[questionIndex]['questionText'] as String),

        //map doesn't change the original into new list but creates a new list here
        //the three dots(...) also called spread operator in the below transforms the nested list as individual list in the surrounding values
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestions(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}