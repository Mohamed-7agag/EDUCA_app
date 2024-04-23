import 'dart:io';

class UserModel {
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? address;
  final File? image;
  final String? studentOrTeacher;
  final String? studentClass;

  UserModel(
      {this.name,
      this.email,
      this.password,
      this.phone,
      this.address,
      this.image,
      this.studentOrTeacher,
      this.studentClass});

  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
    String? address,
    File? image,
    String? studentOrTeacher,
    String? studentClass,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      password: password ?? this.password,
      address: address ?? this.address,
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
      'address': address,
      'studentOrTeacher': studentOrTeacher,
      'studentClass': studentClass,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
      password: json['password'] ?? '',
      address: json['address'] ?? '',
      studentOrTeacher: json['studentOrTeacher'] ?? '',
      studentClass: json['studentClass'] ?? '',
    );
  }
}
