import 'package:field_training_app/Core/api_services/end_points.dart';

class QuizModel {
  final String? description;
  final String? createdDate;
  final int? subjectId;
  final int? quizId;

  QuizModel({
    this.subjectId,
    this.quizId,
    this.description,
    this.createdDate,
  });
 

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel( 
      subjectId: json[ApiKey.subjectId] as int?,
      quizId: json[ApiKey.id] as int?,
      description: json[ApiKey.description] as String?,
      createdDate: json[ApiKey.createdDate] as String?,
    );
  }

}
