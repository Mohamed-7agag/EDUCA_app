import 'package:equatable/equatable.dart';
import 'package:field_training_app/teacher_features/courses/data/models/course_model.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/course_repo/course_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_courses_teacher_state.dart';

class GetAllCoursesTeacherCubit extends Cubit<GetAllCoursesTeacherState> {
  GetAllCoursesTeacherCubit(this.courseRepo) : super(GetAllCoursesTeacherInitial());

  final CourseRepo courseRepo;

  void getCourses({required String teacherId}) async {
    emit(GetAllCoursesTeacherLoading());
    final result =
        await courseRepo.getCourses(teacherId: teacherId);
    result.fold((failure) {
     emit(GetAllCoursesTeacherFailure(failure.toString()));
    }, (courseList) {
      emit(GetAllCoursesTeacherSuccess(courseList));
    });
  }
}
