import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/course_details_teacher_view_body.dart';
import 'package:flutter/material.dart';

class CourseDetailsTeacherView extends StatelessWidget {
  const CourseDetailsTeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: CourseDetailsTeacherViewBody()),
    );
  }
}