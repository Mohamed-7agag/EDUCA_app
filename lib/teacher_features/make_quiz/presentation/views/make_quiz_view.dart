import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/make_quiz_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MakeQuizView extends StatelessWidget {
  const MakeQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: MakeQuizViewBody()),
    );
  }
}
