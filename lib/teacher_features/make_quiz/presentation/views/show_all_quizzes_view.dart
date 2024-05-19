import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/show_all_quizzes_view_body.dart';
import 'package:flutter/material.dart';

class ShowAllQuizzesView extends StatelessWidget {
  const ShowAllQuizzesView({super.key, required this.subjectId});
  final int subjectId;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: ShowAllQuizzesViewBody(subjectId: subjectId,)),
    );
  }
}
