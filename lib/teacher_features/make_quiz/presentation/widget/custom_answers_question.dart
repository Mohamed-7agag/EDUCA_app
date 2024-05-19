import 'package:field_training_app/teacher_features/make_quiz/data/question_model.dart';
import 'package:flutter/material.dart';

class CustomAnswersQuestion extends StatelessWidget {
  const CustomAnswersQuestion({
    super.key,
    required this.questionModel,
    required this.charAnswer,
    required this.idex,
  });

  final QuestionModel questionModel;
  final String charAnswer;
  final int idex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Text(
        "$charAnswer : ${questionModel.option1}",
        style: TextStyle(
          color: questionModel.option1 == questionModel.correctAnswer
              ? Colors.green
              : Colors.red,
          fontSize: 19,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
