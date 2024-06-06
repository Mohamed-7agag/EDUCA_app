import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/course_edit_view_body.dart';
import 'package:flutter/material.dart';

class CourseEditView extends StatelessWidget {
  const CourseEditView({super.key, required this.subjectId});
  final int subjectId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Edit Course'),
      ),
      body:  SafeArea(child: CourseEditViewBody(subjectId: subjectId,)),
    );
  }
}
