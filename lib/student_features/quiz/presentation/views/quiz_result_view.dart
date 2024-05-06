import 'package:flutter/material.dart';

import '../widgets/quiz_result_view_body.dart';

class QuizResultView extends StatelessWidget {
  const QuizResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: QuizResultViewBody()),
    );
  }
}
