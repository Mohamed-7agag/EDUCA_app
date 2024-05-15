class EndPoint {
  static String baseUrl = "http://edu1.runasp.net/api/";
  static String login = "account/login";
  static String studentRegister = "studentaccount/register";
  static String teacherRegister = "teacheraccount/register";
  static String getStudentById(int id) {
    return "student/$id";
  }

  static String getTeacherById(int id) {
    return "teacher/$id";
  }

  static String search(String? teacherName, String? subjectName) {
    return "student/search?teacherName=$teacherName&subjectName=$subjectName";
  }
}

class ApiKey {
  static String code = "code";
  static String description = "description";
  static String token = "token";
  static String id = "id";
  //? for login and register
  static String firstName = "firstName";
  static String lastName = "lastName";
  static String userName = "userName";
  static String email = "email";
  static String password = "password";
  static String phone = "phone";
  static String studentLevel = "level";
  static String address = "address";
  static String image = "profileImage";
  static String imageUrl = "profileImageUrl";
}
