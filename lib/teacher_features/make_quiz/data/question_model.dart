import 'package:field_training_app/teacher_features/make_quiz/data/quiz_model.dart';

List<QuestionModel> questionList = [];
List<QuizModel> quizList = [];
class QuestionModel {
  String question;
  List<String> answers;
  String correctAnswer;
  QuestionModel({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}