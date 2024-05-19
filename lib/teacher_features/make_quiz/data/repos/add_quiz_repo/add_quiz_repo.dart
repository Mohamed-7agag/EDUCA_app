import 'package:dartz/dartz.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/question_model.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/quiz_model.dart';

abstract class AddQuizRepo {
  Future<Either<Failure, QuizModel>> addQuiz({
    required String description,
    required int subjectId,
  });
  Future<Either<Failure, QuestionModel>> addQuestion({
    required String content,
    required int quizId,
    required String option1,
    required String option2,
    required String option3,
    required String option4,
    required String correctAnswer,
  });
}
