import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/course_lisview_item.dart';
import 'package:flutter/material.dart';

class CourseListViewBuider extends StatelessWidget {
  const CourseListViewBuider({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: CourseListViewItem(),
        );
      },
    );
  }
}
