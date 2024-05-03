import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:field_training_app/student_features/profile/data/models/student_model.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/student_repo/student_profile_repo.dart';

part 'student_profile_state.dart';

class StudentProfileCubit extends Cubit<StudentProfileState> {
  StudentProfileCubit(this.studentProfileRepo) : super(StudentProfileInitial());
  final StudentProfileRepo studentProfileRepo;

  // student
  Future<void> getStudentData() async {
    if (CacheHelper.getData(key: optionStateKey) == "طالب") {
      emit(StudentProfileLoading());
      var result = await studentProfileRepo.getStudentData(
        endPoint: EndPoint.getStudentById(
          CacheHelper.getData(key: ApiKey.id),
        ),
      );
      result.fold((failure) {
        emit(StudentProfileFailure(errMessage: failure.errMessage));
      }, (studentModel) {
        emit(StudentProfileSuccess(studentModel: studentModel));
      });
    } else {
      emit(StudentProfileLoading());
      var result = await studentProfileRepo.getTeacherData(
        endPoint: EndPoint.getTeacherById(
          CacheHelper.getData(key: ApiKey.id),
        ),
      );
      result.fold((failure) {
        emit(StudentProfileFailure(errMessage: failure.errMessage));
      }, (teacherModel) {
        emit(StudentProfileSuccess(studentModel: teacherModel));
      });
    }
  }

  Future<void> updateStudentData({
    String? firstName,
    String? lastName,
    String? password,
    String? phone,
    String? studentLeveloraddress,
    String? image,
  }) async {
    if (CacheHelper.getData(key: optionStateKey) == "طالب") {
      emit(StudentProfileUpdateLoading());
      var result = await studentProfileRepo.updateStudentData(
        endPoint: EndPoint.getStudentById(CacheHelper.getData(key: ApiKey.id)),
        firstName: firstName,
        lastName: lastName,
        password: password,
        phone: phone,
        studentLevel: studentLeveloraddress,
        image: image,
      );
      result.fold((failure) {
        emit(StudentProfileUpdateFailure(errMessage: failure.errMessage));
      }, (success) {
        emit(StudentProfileUpdateSuccess());
      });
    } else {
      emit(StudentProfileUpdateLoading());
      var result = await studentProfileRepo.updateTeacherData(
        endPoint: EndPoint.getTeacherById(CacheHelper.getData(key: ApiKey.id)),
        firstName: firstName,
        lastName: lastName,
        password: password,
        phone: phone,
        address: studentLeveloraddress,
        image: image,
      );
      result.fold((failure) {
        emit(StudentProfileUpdateFailure(errMessage: failure.errMessage));
      }, (success) {
        emit(StudentProfileUpdateSuccess());
      });
    }
  }

  // teacher

//   Future<void> getTeacherData() async {
//     emit(TeacherProfileLoading());
//     var result = await studentProfileRepo.getTeacherData(
//       endPoint: EndPoint.getTeacherById(
//         CacheHelper.getData(key: ApiKey.id),
//       ),
//     );
//     result.fold((failure) {
//       emit(TeacherProfileFailure(errMessage: failure.errMessage));
//     }, (teacherModel) {
//       emit(TeacherProfileSuccess(teacherModel: teacherModel));
//     });
//   }

//   Future<void> updateTeacherData({
//     String? firstName,
//     String? lastName,
//     String? password,
//     String? phone,
//     String? address,
//     String? image,
//   }) async {
//     emit(TeacherProfileUpdateLoading());
//     var result = await studentProfileRepo.updateTeacherData(
//       endPoint: EndPoint.getTeacherById(CacheHelper.getData(key: ApiKey.id)),
//       firstName: firstName,
//       lastName: lastName,
//       password: password,
//       phone: phone,
//       address: address,
//       image: image,
//     );
//     result.fold((failure) {
//       emit(TeacherProfileUpdateFailure(errMessage: failure.errMessage));
//     }, (success) {
//       emit(TeacherProfileUpdateSuccess());
//     });
//   }
}
