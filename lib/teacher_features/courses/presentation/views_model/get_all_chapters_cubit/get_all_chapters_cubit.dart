import 'package:equatable/equatable.dart';
import 'package:field_training_app/teacher_features/courses/data/models/chapter_model.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/chapter_files_repo/chaoter_files_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_chapters_state.dart';

class GetAllChaptersCubit extends Cubit<GetAllChaptersState> {
  GetAllChaptersCubit(this.chapterFilesRepo) : super(GetAllChaptersInitial());

  ChapterFilesRepo chapterFilesRepo;

  List<String> chapterNames = [];
  Map<String, int> chapterIndx = {};

  void getChapters({required int subjectId}) async {
    emit(GetAllChaptersLoading());
    final result = await chapterFilesRepo.getAllChapters(subjectId: subjectId);
    result.fold((failure) {
      emit(GetAllChaptersFailure(failure.toString()));
    }, (chaptersList) {
      for (var item in chaptersList) {
        chapterNames.add(item.name!);
        chapterIndx[item.name!] = item.id!;
      }

      emit(GetAllChaptersSuccess(chaptersList));
    });
  }
}
