import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/course_lisview_item.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/get_all_courses_cubit/get_all_courses_teacher_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseListViewBuider extends StatelessWidget {
  const CourseListViewBuider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCoursesTeacherCubit, GetAllCoursesTeacherState>(
      builder: (context, state) {
        if (state is GetAllCoursesTeacherSuccess) {
          return ListView.builder(
            itemCount: state.courses.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CourseListViewItem(
                  course: state.courses[index],
                ),
              );
            },
          );
        } else if (state is GetAllCoursesTeacherFailure) {
          return Center(child: Text(state.message));
        }
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.amber,
        ));
      },
    );
  }
}
