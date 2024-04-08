import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/student_model.dart';

class StudentCubit extends Cubit<Student> {
  StudentCubit()
      : super(Student(
            name: '',
            email: '',
            phone: '',
            studentOrTeacher: '',
            studentClass: ''));

  void updateStudentData({
    required String name,
    required String email,
    required String phone,
    required String studentOrTeacher,
  }) {
    emit(state.copyWith(
        name: name,
        email: email,
        phone: phone,
        studentOrTeacher: studentOrTeacher));
  }

  void updateStudentClass({required String studentClass}) {
    emit(state.copyWith(studentClass: studentClass));
  }
}
