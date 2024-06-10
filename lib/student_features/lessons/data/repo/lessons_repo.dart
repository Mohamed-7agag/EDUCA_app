import 'package:dartz/dartz.dart';
import 'package:field_training_app/student_features/lessons/data/models/lessons_model.dart';

import '../../../../Core/api_services/failure.dart';

abstract class LessonsRepo {
  Future<Either<Failure, List<LessonsModel>>> getLessons({required int subjectID});
}
