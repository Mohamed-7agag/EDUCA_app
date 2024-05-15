// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:field_training_app/Core/utils/constatnt.dart';


import 'package:flutter/material.dart';

import 'package:field_training_app/teacher_features/make_quiz/data/question_model.dart';

class QuestionListViewItem extends StatelessWidget {
  QuestionListViewItem({
    required this.questionModel,
    required this.cnt,
  });
  int cnt;
  QuestionModel questionModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$cnt : ${questionModel.question}",
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "A : ${questionModel.answers[0]}",
            style: TextStyle(
              color: questionModel.answers[0] == questionModel.correctAnswer
                  ? Colors.green
                  : Colors.red,
              fontSize: 19,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "B : ${questionModel.answers[1]}",
            style: TextStyle(
              color: questionModel.answers[1] == questionModel.correctAnswer
                  ? Colors.green
                  : Colors.red,
              fontSize: 19,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "C : ${questionModel.answers[2]}",
            style: TextStyle(
              color: questionModel.answers[2] == questionModel.correctAnswer
                  ? Colors.green
                  : Colors.red,
              fontSize: 19,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "D : ${questionModel.answers[3]}",
            style: TextStyle(
              color: questionModel.answers[3] == questionModel.correctAnswer
                  ? Colors.green
                  : Colors.red,
              fontSize: 19,
            ),
          ),
        ),
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
        const Divider(),
      ],
    );
  }
}
