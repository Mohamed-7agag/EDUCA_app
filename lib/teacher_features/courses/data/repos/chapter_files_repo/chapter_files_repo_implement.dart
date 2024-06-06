// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/teacher_features/courses/data/models/chapter_model.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/chapter_files_repo/chaoter_files_repo.dart';
import 'package:file_picker/src/platform_file.dart';

class ChapterFilesRepoImplement implements ChapterFilesRepo {
  final ApiServices apiServices;
  ChapterFilesRepoImplement({
    required this.apiServices,
  });
  @override
  Future<Either<Failure, ChapterModel>> addChapter({
    required String name,
    required int subjectId,
  }) async {
    try {
      var data = await apiServices.post(
        endPoint: EndPoint.chapters,
        data: {
          "name": name,
          ApiKey.subjectId: subjectId,
        },
      );

      ChapterModel chapterModel = ChapterModel.fromJson(data);

      return right(chapterModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, String>> uploadFile(
      {required int chapterId, required File file}) async{
    
    try {
       await apiServices.post(
        isFromData: true,
        endPoint: EndPoint.uploadFile(chapterId),
        data: {
          "file": await MultipartFile.fromFile(file.path),
        },
      );

  
      return right("sucess");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("حدث خطأ ما"));
    }
    
  }

  @override
  Future<Either<Failure, List<PlatformFile>>> getFiles({required int chapterId}) {
    
    throw UnimplementedError();
  }
}
