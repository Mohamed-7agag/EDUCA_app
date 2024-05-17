import 'package:flutter/material.dart';

import '../widgets/course_details_view_body.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: CourseDetailsViewBody()),
    );
  }
}
