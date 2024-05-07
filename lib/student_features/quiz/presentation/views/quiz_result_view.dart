import 'package:flutter/material.dart';

import '../widgets/quiz_result_view_body.dart';

class QuizResultView extends StatelessWidget {
  const QuizResultView({super.key, required this.numberOfQuestions});
  final int numberOfQuestions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: QuizResultViewBody(numberOfQuestions: numberOfQuestions)),
    );
  }
}
