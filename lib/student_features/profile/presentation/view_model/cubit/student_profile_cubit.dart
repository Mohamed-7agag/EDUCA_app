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
}
