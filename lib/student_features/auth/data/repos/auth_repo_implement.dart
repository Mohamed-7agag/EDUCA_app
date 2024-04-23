import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/student_features/auth/data/models/register_model.dart';
import 'package:field_training_app/student_features/auth/data/repos/auth_repo.dart';

import '../../../../Core/api_services/failure.dart';
import '../models/login_model.dart';

class AuthRepoImplement implements AuthRepo {
  final ApiServices apiServices;

  AuthRepoImplement({required this.apiServices});
  @override
  Future<Either<Failure, LoginModel>> login(
      {required String name, required String password}) async {
    try {
      var data = await apiServices.post(
        endPoint: 'login',
        data: {ApiKey.userName: name, ApiKey.password: password},
      );
      LoginModel loginModel = LoginModel.fromJson(data);
      return right(loginModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> studentRegister(
      {required String name,
      required String email,
      required String password,
      required String phone,
      required String address}) async {
    try {
      var data = await apiServices.post(
        endPoint: 'studentRegister',
        data: {
          ApiKey.userName: name,
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.phone: phone,
          ApiKey.address: address,
        },
      );
      RegisterModel registerModel = RegisterModel.fromJson(data);
      return right(registerModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}
