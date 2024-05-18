import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/utils/app_services.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/add_course_repo/add_Course_repo_implement.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/course_listview_builder.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views_model/cubit/get_all_courses_teacher_cubit.dart';

class CoursesTeacherViewBody extends StatelessWidget {
  const CoursesTeacherViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const CourseListViewBuider();
  }
}
