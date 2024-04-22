import 'dart:io';

class StudentModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? confirmPassword;
  final File? image;
  final String? studentOrTeacher;
  final String? studentClass;

  StudentModel(
      {this.name,
      this.email,
      this.password,
      this.confirmPassword,
      this.phone,
      this.image,
      this.studentOrTeacher,
      this.studentClass});

  StudentModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
    String? confirmPassword,
    File? image,
    String? studentOrTeacher,
    String? studentClass,
  }) {
    return StudentModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      studentOrTeacher: studentOrTeacher ?? this.studentOrTeacher,
      studentClass: studentClass ?? this.studentClass,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'password': password,
      'confirmPassword': confirmPassword,
      'studentOrTeacher': studentOrTeacher,
      'studentClass': studentClass,
    };
  }

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
      password: json['password'] ?? '',
      studentOrTeacher: json['studentOrTeacher'] ?? '',
      studentClass: json['studentClass'] ?? '',
    );
  }
}
