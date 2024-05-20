import 'package:field_training_app/Core/models/question_model.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/show_quiz_listview_builder.dart';
import 'package:flutter/material.dart';

class ShowQuizViewBody extends StatelessWidget {
  const ShowQuizViewBody({super.key, required this.allquestionList, required this.quizId, required this.subjectId, required this.titleQuiz});
  final List<QuestionModel> allquestionList;
  final int quizId ;
  final int subjectId;
  final String titleQuiz;

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
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.createQuizViewRoute,arguments: {
                    'quizId':quizId,
                     'subjectId':subjectId,
                    'titleQuiz':titleQuiz,
                  });
                },
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
