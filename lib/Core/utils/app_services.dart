import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/payment_api_services.dart';
import 'package:field_training_app/student_features/auth/data/repos/auth_repo_implement.dart';
import 'package:field_training_app/student_features/home/data/repo/home_repo_implement.dart';
import 'package:field_training_app/student_features/profile/data/repos/student_repo/student_profile_repo_implement.dart';
import 'package:field_training_app/student_features/search/data/repo/search_repo_implement.dart';
import 'package:field_training_app/student_features/teacher_details_and_subjects/data/repo/teacher_details_repo_implement.dart';
import 'package:field_training_app/teacher_features/profile_teacher/data/repos/teacher_repo/student_profile_repo_implement.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void appServices() {
  getIt.registerLazySingleton<ApiServices>((() => ApiServices(Dio())));
  getIt.registerLazySingleton<PaymentApiServices>(
      (() => PaymentApiServices(Dio())));

  getIt.registerLazySingleton<AuthRepoImplement>(
    () => AuthRepoImplement(
      apiServices: getIt<ApiServices>(),
    ),
  );
  getIt.registerLazySingleton<StudentProfileRepoImplement>(
    () => StudentProfileRepoImplement(
      apiServices: getIt<ApiServices>(),
    ),
  );
  getIt.registerLazySingleton<TeacherProfileRepoImplement>(
    () => TeacherProfileRepoImplement(
      apiServices: getIt<ApiServices>(),
    ),
  );
  getIt.registerLazySingleton<SearchRepoImplement>(
    () => SearchRepoImplement(
      apiServices: getIt<ApiServices>(),
    ),
  );
  getIt.registerLazySingleton<HomeRepoImplement>(
    () => HomeRepoImplement(
      apiServices: getIt<ApiServices>(),
    ),
  );
  getIt.registerLazySingleton<TeacherDetailsRepoImplement>(
    () => TeacherDetailsRepoImplement(
      apiServices: getIt<ApiServices>(),
    ),
  );
}
