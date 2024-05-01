import 'package:dartz/dartz.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/student_features/profile/data/models/student_model.dart';

abstract class StudentProfileRepo {
  Future<Either<Failure, StudentModel>> getStudentData(
      {required String endPoint});
}
