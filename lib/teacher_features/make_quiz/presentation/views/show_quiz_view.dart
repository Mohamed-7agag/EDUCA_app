import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/question_model.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/show_quiz_view_body.dart';
import 'package:flutter/material.dart';

class ShowQuizView extends StatelessWidget {
  const ShowQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${questionList.length} سؤال',
              style: Styles.textStyle18.copyWith(color: kPrimaryColor),
              textDirection: TextDirection.rtl,
            ),
            const Text(
              'الاختبار',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: const ShowQuizViewBody(),
    );
  }
}
