import 'package:field_training_app/Core/models/quiz_model.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:flutter/material.dart';

class ShowAllQuizzesListViewItem extends StatelessWidget {
  const ShowAllQuizzesListViewItem({
    super.key,
    required this.quizModel,
  });
  final QuizModel quizModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.showQuizViewRoute,
            arguments: {
              "quizId": quizModel.quizId,
              "subjectId": quizModel.subjectId , 
              "titleQuiz": quizModel.description,
            });
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListTile(
          leading: const Icon(Icons.description_outlined),
          title: Text(quizModel.description ?? ""),
          subtitle: Row(
            children: [
              Text("10/10/2010"),
              const Spacer(),
              Text('10 اسئلة'),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                onPressed: () {
                  
                },
                icon: const Icon(
                  Icons.edit_outlined,
                  color: kPrimaryColor,
                ),
                label: const Text(
                  'تعديل',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_outlined,
                  color: kPrimaryColor,
                ),
                label: const Text('حذف', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
