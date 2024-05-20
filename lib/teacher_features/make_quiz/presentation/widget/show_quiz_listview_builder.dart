import 'package:field_training_app/Core/models/question_model.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/question_list_view_item.dart';
import 'package:flutter/material.dart';

class ShowQuizListViewBuider extends StatelessWidget {
  const ShowQuizListViewBuider({super.key, required this.allquestionList});

  final List<QuestionModel> allquestionList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allquestionList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: QuestionListViewItem(
            questionModel: allquestionList[index],
            cnt: index + 1,
          ),
        );
      },
    );
  }
}
