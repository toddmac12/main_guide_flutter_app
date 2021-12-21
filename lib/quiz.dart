import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final questionAnswers;
  final Function answerQuestion;
  final indexNum;

  Quiz(this.questionAnswers, this.answerQuestion, this.indexNum);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionAnswers[indexNum]["quesText"]),
        ...((questionAnswers[indexNum]["ansText"] as Map).keys.toList())
            .map((ans) => Answer(answerQuestion, ans)),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}

// Column(
//                 children: [
//                   Question(_questionAnswers[_indexNum]["quesText"]),
//                   ...( (_questionAnswers[_indexNum]["ansText"] as Map).keys.toList())
//                       .map((ans) => Answer(answerQuestion, ans)),
//                 ],
//                 mainAxisAlignment: MainAxisAlignment.center,
//               )