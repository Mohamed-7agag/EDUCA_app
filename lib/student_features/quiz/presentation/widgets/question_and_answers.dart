import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'quiz_answer_item.dart';

class QuestionAndAnswer extends StatelessWidget {
  const QuestionAndAnswer(
      {super.key, required this.questionIndex, required this.answers});

  final int questionIndex;
  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          questions[questionIndex],
          style: Styles.textStyle18,
          textDirection: TextDirection.rtl,
        ),
        SizedBox(height: 30.h),
        Expanded(
          child: SizedBox(
            child: ListView.builder(
              itemCount: answers.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: QuizAnswerItem(
                    studentAnswer: answers[index],
                    questionIndex: questionIndex,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
