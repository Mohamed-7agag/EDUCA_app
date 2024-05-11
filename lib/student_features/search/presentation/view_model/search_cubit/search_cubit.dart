import 'package:equatable/equatable.dart';
import 'package:field_training_app/student_features/search/data/repo/search_repo_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/teacher_searched_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepoImplement) : super(SearchInitial());
  final SearchRepoImplement searchRepoImplement;

  Future<void> getSearchResults(
      String? teacherName, String? subjectName) async {
    emit(SearchLoading());
    final result =
        await searchRepoImplement.getSearchResults(teacherName, subjectName);
    result.fold((failure) {
      emit(SearchFailure(failure.toString()));
    }, (searchedList) {
      emit(SearchSuccess(searchedList));
    });
  }
}
