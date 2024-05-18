import 'package:equatable/equatable.dart';

class SubjectModel extends Equatable {
  final int? id;
  final String? subjName;
  final String? level;
  final String? describtion;
  final int? pricePerHour;
  final String? teacherName;
  final String? profileImageUrl;
  final int? teacherId;
  final int? term;

  const SubjectModel({
    this.id,
    this.subjName,
    this.level,
    this.describtion,
    this.pricePerHour,
    this.teacherName,
    this.profileImageUrl,
    this.teacherId,
    this.term,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'] as int?,
      subjName: json['subjName'] as String?,
      level: json['level'] as String?,
      describtion: json['describtion'] as String?,
      pricePerHour: json['pricePerHour'] as int?,
      teacherName: json['teacherName'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      teacherId: json['teacherId'] as int?,
      term: json['term'] as int?,
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
        'term': term,
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
      term,
    ];
  }
}
