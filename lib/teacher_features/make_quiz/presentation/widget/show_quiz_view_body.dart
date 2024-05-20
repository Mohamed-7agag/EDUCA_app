import 'package:field_training_app/Core/models/question_model.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/show_quiz_listview_builder.dart';
import 'package:flutter/material.dart';

class ShowQuizViewBody extends StatelessWidget {
  const ShowQuizViewBody({super.key, required this.allquestionList});
  final List<QuestionModel> allquestionList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ShowQuizListViewBuider(allquestionList: allquestionList),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add Question'),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                label: const Text('Edit Question'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
