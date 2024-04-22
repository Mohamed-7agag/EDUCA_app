import 'dart:io';

class TeacherModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? confirmPassword;
  final String? studentOrTeacher;
  final File? image;
  final String? city;
  final String? address;

  TeacherModel(
      {this.name,
      this.email,
      this.password,
      this.confirmPassword,
      this.phone,
      this.image,
      this.studentOrTeacher,
      this.city,
      this.address});

  TeacherModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
    String? confirmPassword,
    String? studentOrTeacher,
    File? image,
    String? city,
    String? address,
  }) {
    return TeacherModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      studentOrTeacher: studentOrTeacher ?? this.studentOrTeacher,
      image: image ?? this.image,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      city: city ?? this.city,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'studentOrTeacher': studentOrTeacher,
      'image': image,
      'password': password,
      'confirmPassword': confirmPassword,
      'city': city,
      'address': address,
    };
  }

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      studentOrTeacher: json['studentOrTeacher'] ?? '',
      image: json['image'] ?? '',
      password: json['password'] ?? '',
      confirmPassword: json['confirmPassword'] ?? '',
      city: json['city'] ?? '',
      address: json['address'] ?? '',
    );
  }
}
