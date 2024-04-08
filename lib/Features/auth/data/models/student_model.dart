class Student {
  final String name;
  final String email;
  final String phone;
  final String studentOrTeacher;
  final String studentClass;

  Student(
      {required this.name,
      required this.email,
      required this.phone,
      required this.studentOrTeacher,
      required this.studentClass});


Student copyWith({
    String? name,
    String? email,
    String? phone,
    String? studentOrTeacher,
    String? studentClass,
  }) {
    return Student(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      studentOrTeacher: studentOrTeacher ?? this.studentOrTeacher,
      studentClass: studentClass ?? this.studentClass,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'studentOrTeacher': studentOrTeacher,
      'studentClass': studentClass,
    };
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      studentOrTeacher: json['studentOrTeacher'] ?? '',
      studentClass: json['studentClass'] ?? '',
    );
  }
}
