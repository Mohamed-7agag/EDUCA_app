import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/Core/models/quiz_model.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/repos/add_quiz_repo/add_quiz_repo.dart';

class AddQuizRepoImplement implements AddQuizRepo {
  final ApiServices apiServices;

  AddQuizRepoImplement({required this.apiServices});
  @override
  Future<Either<Failure, QuizModel>> addQuiz(
      {required String description, required int subjectId}) async {
    try {
      var data = await apiServices.post(
        endPoint: EndPoint.quiz,
        data: {ApiKey.subjectId: subjectId, ApiKey.description: description},
      );

      QuizModel quizModel = QuizModel.fromJson(data);

      return right(quizModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("حدث خطأ ما"));
    }
  }
}
