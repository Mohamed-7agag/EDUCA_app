import 'package:dartz/dartz.dart';
import 'package:field_training_app/student_features/auth/data/models/register_model.dart';
import '../../../../Core/api_services/failure.dart';
import '../models/login_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> login(
      {required String name, required String password});

//? we can make one repo for student and teacher and make endpoint required and get it in cubit layer, but in later
  Future<Either<Failure, RegisterModel>> studentRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
    required String image,
  });
  Future<Either<Failure, RegisterModel>> teacherRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
    required String image,
  });
}
