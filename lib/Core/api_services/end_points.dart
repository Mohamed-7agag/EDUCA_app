class EndPoint {
  static String baseUrl = "http://eduplatform.runasp.net/api/";
  static String signIn = "account/login";
  static String studentRegister = "studentaccount/register";
  static String teacherRegister = "teacheraccount/register";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static String status = "status";
  static String message = "message";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String id = "id";
  static String userName = "username";
  static String phone = "phone";
  static String address = "address";
  static String image = "image";
}
