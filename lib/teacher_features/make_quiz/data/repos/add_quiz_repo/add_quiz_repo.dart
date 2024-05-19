import 'package:dartz/dartz.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
<<<<<<< HEAD
import 'package:field_training_app/Core/models/quiz_model.dart';
=======
import 'package:field_training_app/teacher_features/make_quiz/data/question_model.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/quiz_model.dart';
>>>>>>> fd59e1553ec47e776f539099db10f8f0ec0e55fc

abstract class AddQuizRepo {
  Future<Either<Failure, QuizModel>> addQuiz({
    required String description,
    required int subjectId,
  });
<<<<<<< HEAD
=======
  Future<Either<Failure, QuestionModel>> addQuestion({
    required String content,
    required int quizId,
    required String option1,
    required String option2,
    required String option3,
    required String option4,
    required String correctAnswer,
  });
>>>>>>> fd59e1553ec47e776f539099db10f8f0ec0e55fc
}
