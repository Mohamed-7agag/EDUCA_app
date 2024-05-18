import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/teacher_features/courses/data/models/course_model.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/course_repo/course_repo.dart';

class CourseRepoImplement implements CourseRepo {
  final ApiServices apiServices;  

  CourseRepoImplement({required this.apiServices});

  @override
  Future<Either<Failure, List<CourseModel>>> getCourses({
    required String teacherId,    
  }) async {
    try {
      var data = await apiServices.get(
        endPoint: EndPoint.allCoursesWithTeacherId(teacherId),
      );
      List<CourseModel> courseList = [];
      for (var item in data) {
        courseList.add(CourseModel.fromJson(item));
      }
      return right(courseList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}