import 'dart:io';
import 'package:field_training_app/Core/utils/app_regex.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/models/user_model.dart';

class UserCubit extends Cubit<UserModel> {
  UserCubit()
      : super(
          UserModel(
            name: '',
            email: '',
            phone: '',
            image: null,
            address: '',
            studentOrTeacher: '',
            studentLevel: '',
            password: '',
          ),
        );

  void setStudentData({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String studentOrTeacher,
    required String studentClass,
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
    emit(state.copyWith(studentLevel: studentClass));
  }

  void setStudentImage({required File image}) {
    emit(state.copyWith(image: image));
  }

  void logout() {
    emit(
      UserModel(
        name: '',
        email: '',
        phone: '',
        image: null,
        address: '',
        studentOrTeacher: '',
        studentLevel: '',
        password: '',
      ),
    );
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
      emit(state.copyWith(studentLevel: value));
    }
  }
}
//!   create two cubit   studentAuth    teacherAuth
//!   cubit for auth studentLogin  teacherLogin   studentRegister  teacherRegister
//!   cubit for auth studentData  teacherData   update   logout
