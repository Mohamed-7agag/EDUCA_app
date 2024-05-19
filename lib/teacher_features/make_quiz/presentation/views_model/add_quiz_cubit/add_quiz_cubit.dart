<<<<<<< HEAD:lib/teacher_features/make_quiz/presentation/views_model/cubit/add_quiz_cubit.dart
=======
import 'package:bloc/bloc.dart';
>>>>>>> fd59e1553ec47e776f539099db10f8f0ec0e55fc:lib/teacher_features/make_quiz/presentation/views_model/add_quiz_cubit/add_quiz_cubit.dart
import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/models/quiz_model.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/repos/add_quiz_repo/add_quiz_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_quiz_state.dart';

class AddQuizCubit extends Cubit<AddQuizState> {
  AddQuizCubit(this.addQuizRepo) : super(AddQuizInitial());

  final AddQuizRepo addQuizRepo;
  

<<<<<<< HEAD:lib/teacher_features/make_quiz/presentation/views_model/cubit/add_quiz_cubit.dart
  Future<void> addQuiz() async {
    emit(AddQuizLoading());
=======
  Future<void> addQuiz({required String title,required int subjectId}) async {
     emit(AddQuizLoading());
>>>>>>> fd59e1553ec47e776f539099db10f8f0ec0e55fc:lib/teacher_features/make_quiz/presentation/views_model/add_quiz_cubit/add_quiz_cubit.dart
    var result = await addQuizRepo.addQuiz(
      description: title,
      subjectId: subjectId,
    );
    result.fold((failure) {
      emit(AddQuizFailure(errMessage: failure.errMessage));
    }, (quizmodel) {
      emit(AddQuizSuccess(quizModel: quizmodel));
    });
  }
}
