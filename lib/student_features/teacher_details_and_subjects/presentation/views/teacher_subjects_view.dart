import 'package:flutter/material.dart';

import '../widgets/teacher_subjects_view_body.dart';

class TeacherSubjectsView extends StatelessWidget {
  const TeacherSubjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: TeacherSubjectsViewBody()),
    );
  }
}
