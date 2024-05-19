part of 'quiz_cubit.dart';

sealed class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

final class QuizInitial extends QuizState {}

final class QuizLoading extends QuizState {}

final class QuizSuccess extends QuizState {
  final List<QuizModel> quizzes;

  const QuizSuccess({required this.quizzes});
}

final class QuizFaliure extends QuizState {
  final String errMessage;
  const QuizFaliure({required this.errMessage});
}
