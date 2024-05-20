import 'package:field_training_app/Core/models/subject_model.dart';
import 'package:flutter/material.dart';

import '../widgets/course_details_view_body.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView(
      {super.key, required this.subjectModel, this.isEnrolled});
  final SubjectModel subjectModel;
  final bool? isEnrolled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: CourseDetailsViewBody(
        subjectModel: subjectModel,
        isEnrolled: isEnrolled,
      )),
    );
  }
}
