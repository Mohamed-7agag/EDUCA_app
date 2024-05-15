import 'package:field_training_app/teacher_features/make_quiz/data/question_model.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/question_list_view_item.dart';
import 'package:flutter/material.dart';

class ShowQuizListViewBuider extends StatelessWidget {
  const ShowQuizListViewBuider({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: questionList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: QuestionListViewItem(
            questionModel: questionList[index],
            cnt: index + 1,
          ),
        );
      },
    );
  }
}
