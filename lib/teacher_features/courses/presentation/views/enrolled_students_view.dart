import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/enrolled_students_view_body.dart';
import 'package:flutter/material.dart';

class EnrolledStudentsView extends StatelessWidget {
  const EnrolledStudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: EnrolledStudentsViewBody()),
    );
  }
}
