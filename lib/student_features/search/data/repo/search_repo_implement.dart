import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/student_features/search/data/models/teacher_searched_model.dart';
import '../../../../Core/api_services/end_points.dart';
import '../models/subject_searched_model.dart';
import 'search_repo.dart';

class SearchRepoImplement implements SearchRepo {
  ApiServices apiServices;
  SearchRepoImplement({required this.apiServices});

  @override
  Future<Either<Failure, List<TeacherSearchedModel>>> getSearchByTeacherName(
      String? teacherName) async {
    try {
      var data = await apiServices.get(
        endPoint: EndPoint.searchByTeacherOrSubject(teacherName),
      );

      List<TeacherSearchedModel> searchedList = [];
      for (var item in data) {
        searchedList.add(TeacherSearchedModel.fromJson(item));
      }
      return right(searchedList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  //! need edit
  @override
  Future<Either<Failure, List<SubjectSearchedModel>>> getSearchBySubjectName(
      String? subjectName) async {
    try {
      var data = await apiServices.get(
        endPoint: EndPoint.searchByTeacherOrSubject(subjectName),
      );

      List<SubjectSearchedModel> searchedList = [];
      for (var item in data) {
        searchedList.add(SubjectSearchedModel.fromJson(item));
      }
      return right(searchedList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TeacherSearchedModel>>>
      getSearchByTeachersInGovernate(
          String? teacherName, String? governate) async {
    try {
      var data = await apiServices.get(
        endPoint: EndPoint.searchByTeachersInGovernate(teacherName, governate),
      );

      List<TeacherSearchedModel> searchedList = [];
      for (var item in data) {
        searchedList.add(TeacherSearchedModel.fromJson(item));
      }
      return right(searchedList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
