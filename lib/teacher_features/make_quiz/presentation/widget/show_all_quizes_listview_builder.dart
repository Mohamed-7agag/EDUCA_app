import 'package:field_training_app/Core/utils/routes.dart';

import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/show_all_quizzes_listview_item.dart';
import 'package:flutter/material.dart';

class ShowAllQuizzesListViewBuilder extends StatelessWidget {
  ShowAllQuizzesListViewBuilder({super.key});

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ShowAllQuizzesListViewItem(
                  questionNumbers: "10",
                  quizDate: "20/04/2023",
                  quizName: "اختبار المرحلة الثانية",
                  onDelete: () {},
                  onEdit: () {},
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24, right: 20, left: 20),
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("اضافة اختبار جديد"),
                  content: TextField(
                    decoration: const InputDecoration(
                      labelText: "اسم الاختبار",
                    ),
                    controller: controller,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        if (controller.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("يجب عليك ادخال اسم الاختبار"),
                            ),
                          );
                        } else {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed(
                            Routes.createQuizViewRoute,
                            arguments: controller.text,
                          );
                        }
                      },
                      child: const Text("اضافة"),
                    ),
                  ],
                ),
              );
            },
            child: const Text("اضافة اختبار جديد"),
          ),
        ),
      ],
    );
  }
}
