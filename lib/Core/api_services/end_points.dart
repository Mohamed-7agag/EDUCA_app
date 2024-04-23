class EndPoint {
  static String baseUrl = "https://food-api-omega.vercel.app/api/v1/";
  static String signIn = "user/signin";
  static String studentRegister = "user/signup";
  static String teacherRegister = "user/signup";
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
