import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/payment_api_services.dart';
import 'package:field_training_app/student_features/auth/data/repos/auth_repo_implement.dart';
import 'package:field_training_app/student_features/profile/data/repos/student_repo/student_profile_repo_implement.dart';
import 'package:field_training_app/student_features/search/data/repo/search_repo_implement.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/add_course_repo/add_Course_repo_implement.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/cubit/add_course_cubit.dart';
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

  getIt.registerLazySingleton<AddCourseRepoImplement>(
    () => AddCourseRepoImplement(
      apiServices: getIt<ApiServices>(),
    ),
  );
}
