import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/course_edit_view_body.dart';
import 'package:flutter/material.dart';

class CourseEditView extends StatelessWidget {
  const CourseEditView({super.key, required this.subjectId, required this.chaptersN});
  final int subjectId;
  final List<String> chaptersN ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Edit Course'),
      ),
      body: SafeArea(
          child: CourseEditViewBody(
          chaptersN: chaptersN,
        subjectId: subjectId,
      )),
    );
  }
}
