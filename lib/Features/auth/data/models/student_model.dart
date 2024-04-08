class Student {
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? studentOrTeacher;
  final String? studentClass;

  Student(
      {this.name,
      this.email,
      this.password,
      this.phone,
      this.studentOrTeacher,
      this.studentClass});

  Student copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
    String? studentOrTeacher,
    String? studentClass,
  }) {
    return Student(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      studentOrTeacher: studentOrTeacher ?? this.studentOrTeacher,
      studentClass: studentClass ?? this.studentClass,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'studentOrTeacher': studentOrTeacher,
      'studentClass': studentClass,
    };
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      password: json['password'] ?? '',
      studentOrTeacher: json['studentOrTeacher'] ?? '',
      studentClass: json['studentClass'] ?? '',
    );
  }
}
