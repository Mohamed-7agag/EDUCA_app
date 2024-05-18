import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/add_course_repo/add_course_repo.dart';
import 'package:flutter/material.dart';

part 'add_course_state.dart';

class AddCourseCubit extends Cubit<AddCourseState> {
  AddCourseCubit(this.addCourseRepo) : super(AddCourseInitial());

  final AddCourseRepo addCourseRepo;

  TextEditingController controller=TextEditingController();

  String level='';
  String subjName='';
  String trem='';
  int price=0;


  Future<void> addCourse() async {
    emit(AddCourseLoading());
    var result = await addCourseRepo.addCourse(
      level: level,
      subjectName: subjName,
      pricePerHour: price,
      describtion: controller.text,
    );
    result.fold((failure) {
      print("failed");
      emit(AddCourseFailure(errMessage: failure.errMessage));
    }, (courseModel) {
       print("success");
      emit(AddCourseSuccess());
    });
  }
}
