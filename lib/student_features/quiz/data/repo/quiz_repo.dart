
import 'package:dartz/dartz.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/Core/models/quiz_model.dart';

abstract class QuizRepo {
  Future<Either<Failure, List<QuizModel>>> getAllQuizzesAssociatedWithSubject(
      {required int subjectID});
}
