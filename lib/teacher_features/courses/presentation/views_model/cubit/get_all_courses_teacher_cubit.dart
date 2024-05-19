import 'package:equatable/equatable.dart';
import 'package:field_training_app/teacher_features/courses/data/models/course_model.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/course_repo/course_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_courses_teacher_state.dart';

class GetAllCoursesTeacherCubit extends Cubit<GetAllCoursesTeacherState> {
  GetAllCoursesTeacherCubit(this.courseRepo) : super(GetAllCoursesTeacherInitial());

  final CourseRepo courseRepo;

  void getCourses({required int teacherId}) async {
    emit(GetAllCoursesTeacherLoading());
    final result =
        await courseRepo.getCourses(teacherId:8);
    result.fold((failure) {
      print("failed");
     emit(GetAllCoursesTeacherFailure(failure.toString()));
    }, (courseList) {
      print("success");
      emit(GetAllCoursesTeacherSuccess(courseList));
    });
  }

  void deleteCourse( {required int subjectId}) async {
    emit(GetAllCoursesDeleteSubjectLoading());
    final result =
        await courseRepo.deleteCourse(subjectId: subjectId);
     
    result.fold((failure) {
      print("failed");
      emit(GetAllCoursesDeleteSubjectFailure(failure.toString()));
    }, (courseList) {
      print("success");
      emit(GetAllCoursesDeleteSubjectSuccess());
    });
  }
}
