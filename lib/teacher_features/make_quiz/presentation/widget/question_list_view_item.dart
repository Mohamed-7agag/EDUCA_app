// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:field_training_app/teacher_features/make_quiz/data/question_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionListViewItem extends StatelessWidget {
  QuestionListViewItem({
    super.key,
    required this.questionModel,
    required this.cnt,
  });
  int cnt;
  QuestionModel questionModel;

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Text(
            "A : ${questionModel.answers[0]}",
            style: TextStyle(
              color: questionModel.answers[0] == questionModel.correctAnswer
                  ? Colors.green
                  : Colors.red,
              fontSize: 19,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Text(
            "B : ${questionModel.answers[1]}",
            style: TextStyle(
              color: questionModel.answers[1] == questionModel.correctAnswer
                  ? Colors.green
                  : Colors.red,
              fontSize: 19,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Text(
            "C : ${questionModel.answers[2]}",
            style: TextStyle(
              color: questionModel.answers[2] == questionModel.correctAnswer
                  ? Colors.green
                  : Colors.red,
              fontSize: 19,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Text(
            "D : ${questionModel.answers[3]}",
            style: TextStyle(
              color: questionModel.answers[3] == questionModel.correctAnswer
                  ? Colors.green
                  : Colors.red,
              fontSize: 19,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  ),
                  child: const Text(
                    "تعديل",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  )),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                ),
                onPressed: () {},
                child: const Text("حذف", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        const Divider(),
      ],
    );
  }
}
