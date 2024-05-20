class EndPoint {
  static String baseUrl = "http://edu1.runasp.net/api/";
  static String login = "account/login";
  static String studentRegister = "studentaccount/register";
  static String teacherRegister = "teacheraccount/register";
  static String subject = "subject";
  static String quiz = "quiz";
  static String questions = "questions";
  static String getStudentById(int id) {
    return "student/$id";
  }

  static String getTeacherById(int id) {
    return "teacher/$id";
  }

  static String searchByTeacherOrSubject(String? searchName) {
    return "student/search?searchQuery=$searchName";
  }

  

  static String searchByTeachersInGovernate(
      String? teacherName, String? governorate) {
    return "student/search?searchQuery=$teacherName&Governorate=$governorate";
  }

  static String allCoursesWithTeacherId(int id) {
    return "subject/$id/subjects";
  }
  static String deleteSubjectWithTeacherId(int id) {
    return "subject/$id";
  }

  static String getAllGuizsBySubjectId(int id) {
    return "subject/$id/quizzes";
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
  static String governorate = "Governorate";
  static String image = "profileImage";
  static String imageUrl = "profileImageUrl";

  static String teacherId = "teacherId";
  static String subjectName = "subjName";
  static String pricePerHour = "pricePerHour";
  static String level = "level";
  static String describtion = "describtion";
  static String addingTime = "addingTime";
  static String subjectId = "subjectId";

  static String content = "content";
  static String correctAnswer = "correctAnswer";
  static String quizId = "quizId";
  static String option1 = "option1";
  static String option2 = "option2";
  static String option3 = "option3";
  static String option4 = "option4"; 
  static String createdDate="createdDate"; 
}
