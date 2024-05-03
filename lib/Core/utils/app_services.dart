import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/student_features/auth/data/repos/auth_repo_implement.dart';
import 'package:field_training_app/student_features/profile/data/repos/student_repo/student_profile_repo_implement.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void appServices() {
  getIt.registerLazySingleton<ApiServices>((() => ApiServices(Dio())));

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
}
