import 'package:equatable/equatable.dart';

class TeacherModel extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? address;
  final String? profileImageUrl;

  const TeacherModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.address,
    this.profileImageUrl,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) => TeacherModel(
        id: json['id'] as int?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        address: json['address'] as String?,
        profileImageUrl: json['profileImageUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phone,
        'address': address,
        'profileImageUrl': profileImageUrl,
      };

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      email,
      phone,
      address,
      profileImageUrl,
    ];
  }
}
