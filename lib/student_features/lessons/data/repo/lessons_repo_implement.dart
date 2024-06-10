import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/api_services/failure.dart';

import '../models/lessons_model.dart';
import 'lessons_repo.dart';

class LessonsRepoImplement implements LessonsRepo {
  final ApiServices apiServices;

  LessonsRepoImplement({required this.apiServices});
  @override
  Future<Either<Failure, List<LessonsModel>>> getLessons(
      {required int subjectID}) async {
    try {
      final response = await apiServices.get(
        endPoint: EndPoint.getAllChaptersBySubjectId(subjectID),
      );
      List<LessonsModel> lessons = [];
      for (var element in response) {
        lessons.add(LessonsModel.fromJson(element));
      }
      return right(lessons);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
