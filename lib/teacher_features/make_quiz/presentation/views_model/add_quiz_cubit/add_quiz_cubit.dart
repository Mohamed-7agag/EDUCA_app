import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/quiz_model.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/repos/add_quiz_repo/add_quiz_repo.dart';

part 'add_quiz_state.dart';

class AddQuizCubit extends Cubit<AddQuizState> {
  AddQuizCubit(this.addQuizRepo) : super(AddQuizInitial());

  final AddQuizRepo addQuizRepo;
  

  Future<void> addQuiz({required String title}) async {
     emit(AddQuizLoading());
    var result = await addQuizRepo.addQuiz(
      description: title,
      subjectId: 25,
    );
    result.fold((failure) {
      print("failed quiz add");
      emit(AddQuizFailure(errMessage: failure.errMessage));
    }, (quizmodel) {
       print("success quiz add");
      emit(AddQuizSuccess( quizModel: quizmodel));
    });
  }
}
