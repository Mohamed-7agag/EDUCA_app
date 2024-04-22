import 'dart:io';
import 'package:field_training_app/Core/utils/app_regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/models/student_model.dart';

class StudentCubit extends Cubit<StudentModel> {
  StudentCubit()
      : super(StudentModel(
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
    emit(StudentModel(
        name: '',
        email: '',
        phone: '',
        image: null,
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
//!   create two cubit   studentAuth    teacherAuth
//!   cubit for auth studentLogin  teacherLogin   studentRegister  teacherRegister
//!   cubit for auth studentData  teacherData   update   logout

enum AuthState { initial, loading, success, failure }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void login() {
    
  }

  void studentRegister() {
    
  }

  void teacherRegister() {
    
  }
}
