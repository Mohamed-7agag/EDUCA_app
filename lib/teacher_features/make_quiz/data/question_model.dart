List<QuestionModel> questionList = [];
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