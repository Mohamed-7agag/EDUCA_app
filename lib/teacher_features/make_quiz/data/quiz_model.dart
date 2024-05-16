import 'package:field_training_app/teacher_features/make_quiz/data/question_model.dart';

class QuizModel {
  QuizModel({
    required this.title,
    required this.date,
    required this.questions,
  });
  final String title;
  final String date;
  final List<QuestionModel> questions;
}