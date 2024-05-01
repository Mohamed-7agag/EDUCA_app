import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/failure.dart';

import '../models/student_model.dart';
import 'student_profile_repo.dart';

class StudentProfileRepoImplement implements StudentProfileRepo {
  final ApiServices apiServices;

  StudentProfileRepoImplement({required this.apiServices});
  @override
  Future<Either<Failure, StudentModel>> getStudentData(
      {required String endPoint}) async {
    try {
      var data = await apiServices.get(endPoint: endPoint);
      StudentModel studentModel = StudentModel.fromJson(data);
      return right(studentModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
