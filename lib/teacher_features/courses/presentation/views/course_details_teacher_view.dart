import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/teacher_features/courses/data/models/course_model.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/course_details_teacher_view_body.dart';
import 'package:flutter/material.dart';

class CourseDetailsTeacherView extends StatelessWidget {
  const CourseDetailsTeacherView({super.key, required this.courseModel});

  final CourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, Routes.customBottomBarForTeacherViewRoute,
            );
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CourseDetailsTeacherViewBody(
          courseModel: courseModel,
        ),
      ),
    );
  }
}
