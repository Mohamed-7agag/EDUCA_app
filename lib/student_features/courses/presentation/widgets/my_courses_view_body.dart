import 'package:field_training_app/Core/models/subject_model.dart';
import 'package:field_training_app/student_features/courses/presentation/widgets/my_courses_item.dart';
import 'package:flutter/material.dart';

class MyCoursesViewBody extends StatelessWidget {
  const MyCoursesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 6),
            child: MyCoursesItem(subjectModel: SubjectModel(),),
          );
        },
      ),
    );
  }
}
