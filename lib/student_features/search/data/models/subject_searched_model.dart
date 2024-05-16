import 'package:equatable/equatable.dart';

class SubjectSearchedModel extends Equatable {
  final int? id;
  final String? subjName;
  final String? level;
  final String? describtion;
  final int? pricePerHour;
  final String? teacherName;
  final String? profileImageUrl;
  final int? teacherId;

  const SubjectSearchedModel({
    this.id,
    this.subjName,
    this.level,
    this.describtion,
    this.pricePerHour,
    this.teacherName,
    this.profileImageUrl,
    this.teacherId,
  });

  factory SubjectSearchedModel.fromJson(Map<String, dynamic> json) {
    return SubjectSearchedModel(
      id: json['id'] as int?,
      subjName: json['subjName'] as String?,
      level: json['level'] as String?,
      describtion: json['describtion'] as String?,
      pricePerHour: json['pricePerHour'] as int?,
      teacherName: json['teacherName'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      teacherId: json['teacherId'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'subjName': subjName,
        'level': level,
        'describtion': describtion,
        'pricePerHour': pricePerHour,
        'teacherName': teacherName,
        'profileImageUrl': profileImageUrl,
        'teacherId': teacherId,
      };

  @override
  List<Object?> get props {
    return [
      id,
      subjName,
      level,
      describtion,
      pricePerHour,
      teacherName,
      profileImageUrl,
      teacherId,
    ];
  }
}
