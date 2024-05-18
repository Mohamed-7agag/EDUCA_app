import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/models/teacher_model.dart';
import 'package:field_training_app/student_features/teacher_details_and_subjects/data/repo/teacher_details_repo_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'teacher_details_state.dart';

class TeacherDetailsCubit extends Cubit<TeacherDetailsState> {
  TeacherDetailsCubit(this.teacherDetailsRepoImplement)
      : super(TeacherDetailsInitial());
  final TeacherDetailsRepoImplement teacherDetailsRepoImplement;

  Future<void> getTeacherData({required int teacherID}) async {
    emit(TeacherDetailsLoading());
    final result =
        await teacherDetailsRepoImplement.getTeacherData(teacherID: teacherID);
    result.fold(
      (failure) => emit(TeacherDetailsFailure(errMessage: failure.toString())),
      (teacherModel) => emit(TeacherDetailsSuccess(teacherModel: teacherModel)),
    );
  }
}
