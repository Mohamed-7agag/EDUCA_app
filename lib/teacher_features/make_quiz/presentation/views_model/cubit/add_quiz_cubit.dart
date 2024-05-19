import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/models/quiz_model.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/repos/add_quiz_repo/add_quiz_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_quiz_state.dart';

class AddQuizCubit extends Cubit<AddQuizState> {
  AddQuizCubit(this.addQuizRepo) : super(AddQuizInitial());

  final AddQuizRepo addQuizRepo;

  Future<void> addQuiz() async {
    emit(AddQuizLoading());
    var result = await addQuizRepo.addQuiz(
      description: 'description',
      subjectId: 25,
    );
    result.fold((failure) {
      emit(AddQuizFailure(errMessage: failure.errMessage));
    }, (quizmodel) {
      emit(AddQuizSuccess(quizModel: quizmodel));
    });
  }
}
