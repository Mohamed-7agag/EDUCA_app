import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/make_quiz_view_body.dart';
import 'package:flutter/material.dart';

class MakeQuizView extends StatelessWidget {
  const MakeQuizView({
    super.key,
    required this.titleQuiz,
    required this.quizId,
    required this.subjectId,
  });
  final String titleQuiz;
  final int quizId;
  final int subjectId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: MakeQuizViewBody(
        subjectId: subjectId,
        titleQuiz: titleQuiz,
        quizId: quizId,
      )),
    );
  }
}
