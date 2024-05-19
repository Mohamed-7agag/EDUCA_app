import 'package:flutter/material.dart';

import '../widgets/quiz_result_view_body.dart';

class QuizResultView extends StatelessWidget {
  const QuizResultView(
      {super.key,
      required this.numberOfQuestions,
      required this.numberOfCorrectAnswers});
  final int numberOfQuestions;
  final int numberOfCorrectAnswers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: QuizResultViewBody(
        numberOfQuestions: numberOfQuestions,
        numberOfCorrectAnswers: numberOfCorrectAnswers,
      )),
    );
  }
}
