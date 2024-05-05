import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'quiz_answer_item.dart';

class QuestionAndAnswer extends StatelessWidget {
  const QuestionAndAnswer(
      {super.key, required this.question, required this.answers});

  final String question;
  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            question,
            style: Styles.textStyle18,
            textDirection: TextDirection.rtl,
          ),
          SizedBox(height: 20.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              "assets/images/math.png",
              height: 170.h,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 600.h,
            child: ListView.builder(
              itemCount: answers.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: QuizAnswerItem(
                    text: answers[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
