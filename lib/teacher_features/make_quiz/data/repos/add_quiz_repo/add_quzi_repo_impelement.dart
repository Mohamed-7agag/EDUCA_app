import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/Core/models/quiz_model.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/question_model.dart';
 
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

  @override
  Future<Either<Failure, QuestionModel>> addQuestion(
      {required String content,
      required int quizId,
      required String option1,
      required String option2,
      required String option3,
      required String option4,
      required String correctAnswer}) async {
    try {
      var data = await apiServices.post(
        endPoint: EndPoint.questions,
        data: {
          ApiKey.content: content,
          ApiKey.quizId: quizId,
          ApiKey.option1: option1,
          ApiKey.option2: option2,
          ApiKey.option3: option3,
          ApiKey.option4: option4,
          ApiKey.correctAnswer: correctAnswer
        },
      );

      QuestionModel questionModel = QuestionModel.fromJson(data);

      return right(questionModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("حدث خطأ ما"));
    }
  }
}
