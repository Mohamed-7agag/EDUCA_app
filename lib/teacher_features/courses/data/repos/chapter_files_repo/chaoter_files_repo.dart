import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/teacher_features/courses/data/models/chapter_model.dart';
import 'package:file_picker/file_picker.dart';

abstract class ChapterFilesRepo {
  Future<Either<Failure, ChapterModel>> addChapter({
    required String name,
    required int subjectId,
  });

  Future<Either<Failure, String>> uploadFile({
    required int chapterId,
    required File file,   
  });

  Future<Either<Failure, List<PlatformFile>>> getFiles({
    required int chapterId,
  });

  

}