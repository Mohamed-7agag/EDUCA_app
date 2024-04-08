import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/student_model.dart';

class StudentCubit extends Cubit<Student> {
  StudentCubit()
      : super(Student(
          name: '',
          email: '',
          phone: '',
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
    } else if (parameter == 'email') {
      emit(state.copyWith(email: value));
    } else if (parameter == 'phone') {
      emit(state.copyWith(phone: value));
    } else if (parameter == 'password') {
      emit(state.copyWith(password: value));
    } else if (parameter == 'studentOrTeacher') {
      emit(state.copyWith(studentOrTeacher: value));
    } else if (parameter == 'studentClass') {
      emit(state.copyWith(studentClass: value));
    }
  }
}

