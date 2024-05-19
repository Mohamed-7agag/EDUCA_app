import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/question_model.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/repos/add_quiz_repo/add_quiz_repo.dart';

part 'add_question_state.dart';

class AddQuestionCubit extends Cubit<AddQuestionState> {
  AddQuestionCubit(this.addQuizRepo) : super(AddQuestionInitial());

  final AddQuizRepo addQuizRepo;

  Future<void> addQuestion({
    required int quizId,
    required String content,
    required String option1,
    required String option2,
    required String option3,
    required String option4,
    required String correctAnswer,
  }) async {
    emit(AddQuestionLoading());
    var result = await addQuizRepo.addQuestion(
      content: content,
      option1: option1,
      option2: option2,
      option3: option3,
      option4: option4,
      correctAnswer: correctAnswer,
      quizId: quizId,
    );
    result.fold((failure) {
      print("failed question add");
      emit(AddQuestionFailure(errMessage: failure.errMessage));
    }, (questionmodel) {
      print("success question add");
      emit(AddQuestionSuccess( questionModel: questionmodel));
    });
  }


}
