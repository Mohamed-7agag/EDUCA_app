import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/make_quiz_view_body.dart';
import 'package:flutter/material.dart';

class MakeQuizView extends StatelessWidget {
<<<<<<< HEAD
  const MakeQuizView(
      {super.key, required this.titleQuiz, required this.quizId});
=======
  const MakeQuizView({super.key, required this.titleQuiz, required this.quizId, });
>>>>>>> fd59e1553ec47e776f539099db10f8f0ec0e55fc
  final String titleQuiz;
  final int quizId ;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: SafeArea(
          child: MakeQuizViewBody(
        titleQuiz: titleQuiz,
        quizId: quizId,
      )),
=======
      body: SafeArea(child: MakeQuizViewBody(titleQuiz: titleQuiz, quizId: quizId,)),
>>>>>>> fd59e1553ec47e776f539099db10f8f0ec0e55fc
    );
  }
}
