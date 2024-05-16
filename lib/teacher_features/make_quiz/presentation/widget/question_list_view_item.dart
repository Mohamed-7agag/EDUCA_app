// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/custom_answers_question.dart';
import 'package:flutter/material.dart';

import 'package:field_training_app/teacher_features/make_quiz/data/question_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class QuestionListViewItem extends StatelessWidget {
  QuestionListViewItem({
    super.key,
    required this.questionModel,
    required this.cnt,
  });
  int cnt;
 final QuestionModel questionModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "$cnt : ${questionModel.question}",
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 10),
        CustomAnswersQuestion(
          charAnswer: "A",
          questionModel: questionModel,
          idex: 0,
        ),
        CustomAnswersQuestion(
          charAnswer: "B",
          questionModel: questionModel,
          idex: 1,
        ),
        CustomAnswersQuestion(
          charAnswer: "C",
          questionModel: questionModel,
          idex: 2,
        ),
        CustomAnswersQuestion(
          charAnswer: "D",
          questionModel: questionModel,
          idex: 3,
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                ),
                child: const Text(
                  "تعديل",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(width: 15),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
              ),
              onPressed: () {},
              child: const Text("حذف", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        const Divider(),
      ],
    );
  }
}

