import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

typedef AnswerQuestionFunction = void Function(int score);

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;

  final AnswerQuestionFunction answerQuestion;

  final int questionIndex;

  const Quiz(
      {Key? key,
      required this.questions,
      required this.answerQuestion,
      required this.questionIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'] as String),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) => Answer(
                () => answerQuestion(answer['score'] as int),
                answer['text'] as String))
            .toList(),
      ],
    );
  }
}
