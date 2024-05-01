import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:field_training_app/student_features/profile/data/models/student_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/student_profile_repo.dart';

part 'student_profile_state.dart';

class StudentProfileCubit extends Cubit<StudentProfileState> {
  StudentProfileCubit(this.studentProfileRepo) : super(StudentProfileInitial());
  final StudentProfileRepo studentProfileRepo;

  Future<void> getStudentData() async {
    emit(StudentProfileLoading());
    var result = await studentProfileRepo.getStudentData(
        endPoint: EndPoint.getStudentById(CacheHelper.getData(key: ApiKey.id)));
    result.fold((failure) {
      emit(StudentProfileFailure(errMessage: failure.errMessage));
    }, (studentModel) {
      emit(StudentProfileSuccess(studentModel: studentModel));
    });
  }

  Future<void> updateStudentData({
    String? firstName,
    String? lastName,
    String? password,
    String? phone,
    String? studentLevel,
    String? image,
  }) async {
    emit(StudentProfileUpdateLoading());
    var result = await studentProfileRepo.updateStudentData(
      endPoint: EndPoint.getStudentById(CacheHelper.getData(key: ApiKey.id)),
      firstName: firstName,
      lastName: lastName,
      password: password,
      phone: phone,
      studentLevel: studentLevel,
      image: image,
    );
    result.fold((failure) {
      emit(StudentProfileUpdateFailure(errMessage: failure.errMessage));
    }, (success) {
      emit(StudentProfileUpdateSuccess());
    });
  }
}
