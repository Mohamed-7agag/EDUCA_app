import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';

class CourseModel extends Equatable {
  final int? teacherId;
  final String? level;
  final String? subjectName;
  final String? addingTime;
  final String? describtion;
  final int? pricePerHour;

  const CourseModel({
    this.teacherId,
    this.level,
    this.subjectName,
    this.addingTime,
    this.describtion,
    this.pricePerHour,
  });

 factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        teacherId: json[ApiKey.teacherId] as int?,
        level: json[ApiKey.level] as String?,
        describtion: json[ApiKey.describtion] as String?,
        subjectName:  json[ApiKey.subjectName] as String?,
        addingTime: json[ApiKey.addingTime] as String?,
        pricePerHour: json[ApiKey.pricePerHour] as int?,
      );

  Map<String, dynamic> toJson() => {
        ApiKey.teacherId: teacherId,
        ApiKey.level: level,
        ApiKey.describtion: describtion,
        ApiKey.subjectName: subjectName,
        ApiKey.addingTime: addingTime,
        ApiKey.pricePerHour: pricePerHour,
      };

  @override
  List<Object?> get props => [
        teacherId,
        level,
        describtion,
        subjectName,
        addingTime,
        pricePerHour,
      ];
}
