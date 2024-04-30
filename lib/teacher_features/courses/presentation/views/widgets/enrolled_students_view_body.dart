import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/enrolled_student_list_view_item.dart';
import 'package:flutter/material.dart';

class EnrolledStudentsViewBody extends StatelessWidget {
  const EnrolledStudentsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: EnrolledStudentListViewItem(),
        );
      },
    );
  }
}

// class EnrolledStudentListViewItem extends StatelessWidget {
//   const EnrolledStudentListViewItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card();
//   }
// }