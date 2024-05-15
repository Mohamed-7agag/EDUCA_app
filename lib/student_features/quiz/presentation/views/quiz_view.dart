import 'package:flutter/material.dart';

import '../widgets/quiz_view_body.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: QuizViewBody()),
    );
  }
}
