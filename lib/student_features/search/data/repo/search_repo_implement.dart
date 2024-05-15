import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/student_features/search/data/models/teacher_searched_model.dart';
import '../../../../Core/api_services/end_points.dart';

class SearchRepoImplement {
  ApiServices apiServices;
  SearchRepoImplement({required this.apiServices});

  Future<Either<Failure, List<TeacherSearchedModel>>> getSearchResults(
      String? teacherName, String? subjectName) async {
    try {
      var data = await apiServices.get(
        endPoint: EndPoint.search(teacherName, subjectName),
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
