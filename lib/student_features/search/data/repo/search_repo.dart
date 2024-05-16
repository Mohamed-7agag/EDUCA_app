import 'package:dartz/dartz.dart';
import 'package:field_training_app/Core/api_services/failure.dart';

import '../models/subject_searched_model.dart';
import '../models/teacher_searched_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<TeacherSearchedModel>>> getSearchByTeacherName(
      String? teacherName);
  Future<Either<Failure, List<SubjectSearchedModel>>>
      getSearchBySubjectName(String? subjectName);
  Future<Either<Failure, List<TeacherSearchedModel>>>
      getSearchByTeachersInGovernate(String? teacherName, String? governate);
}
