import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/utils/app_services.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/add_course_repo/add_Course_repo_implement.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/cubit/get_all_courses_teacher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/courser_teacher_viewbody.dart';

class CoursesTeacherView extends StatelessWidget {
  const CoursesTeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  CoursesTeacherViewBody(),
    );
  }
}
