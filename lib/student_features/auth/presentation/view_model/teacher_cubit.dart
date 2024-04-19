import 'dart:io';
import 'package:field_training_app/Core/models/teacher_model.dart';
import 'package:field_training_app/Core/utils/app_regex.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherCubit extends Cubit<TeacherModel> {
  TeacherCubit()
      : super(TeacherModel(
          name: '',
          email: '',
          phone: '',
          image: null,
          studentOrTeacher: '',
          city: '',
          address: '',
          password: '',
        ));

  void setTeacherData({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String studentOrTeacher,
  }) {
    emit(state.copyWith(
      name: name,
      email: email,
      phone: phone,
      password: password,
      studentOrTeacher: studentOrTeacher,
    ));
  }

  void setTeacherCityAndAddress({required String city, required String address}) {
    emit(state.copyWith(city: city, address: address));
  }
  void setTeacherImage({required File image}) {
    emit(state.copyWith(image: image));
  }

  void logout() {
    emit(TeacherModel(
        name: '',
        email: '',
        phone: '',
        image: null,
        studentOrTeacher: '',
        city: '',
        address: '',
        password: ''));
  }

  void updateData(String parameter, String value) {
    if (parameter == 'name') {
      emit(state.copyWith(name: value));
    } else if (parameter == 'email' && AppRegex.isEmailValid(value)) {
      emit(state.copyWith(email: value));
    } else if (parameter == 'phone' && AppRegex.isPhoneNumberValid(value)) {
      emit(state.copyWith(phone: value));
    } else if (parameter == 'password' && AppRegex.hasMinLength(value)) {
      emit(state.copyWith(password: value));
    } else if (parameter == 'studentOrTeacher') {
      emit(state.copyWith(studentOrTeacher: value));
    } else if (parameter == 'city') {
      emit(state.copyWith(city: value));
    }else if (parameter == 'address') {
      emit(state.copyWith(address: value));
    }
  }
}
//!   create to cubit   studentAuth    teacherAuth
//!   cubit for auth studentLogin  teacherLogin   studentRegister  teacherRegister     
//!   cubit for auth studentData  teacherData   update   logout