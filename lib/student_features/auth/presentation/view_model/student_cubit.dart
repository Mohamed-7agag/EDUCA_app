import 'dart:io';

import 'package:field_training_app/Core/utils/app_regex.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/student_model.dart';

class StudentCubit extends Cubit<Student> {
  StudentCubit()
      : super(Student(
          name: '',
          email: '',
          phone: '',
          image: null,
          studentOrTeacher: '',
          studentClass: '',
          password: '',
        ));

  void setStudentData({
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

  void setStudentClass({required String studentClass}) {
    emit(state.copyWith(studentClass: studentClass));
  }
  void setStudentImage({required File image}) {
    emit(state.copyWith(image: image));
  }

  void logout() {
    emit(Student(
        name: '',
        email: '',
        phone: '',
        studentOrTeacher: '',
        studentClass: '',
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
    } else if (parameter == 'studentClass') {
      emit(state.copyWith(studentClass: value));
    }
  }
}
