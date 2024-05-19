import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/api_services/payment_api_services.dart';
import 'package:field_training_app/Core/models/subject_model.dart';
import 'package:field_training_app/Core/utils/app_services.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:field_training_app/student_features/auth/data/repos/auth_repo_implement.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/register_option_cubit.dart';
import 'package:field_training_app/student_features/courses/presentation/view_model/favourite_courses_cubit.dart';
import 'package:field_training_app/student_features/courses/presentation/views/course_details_view.dart';
import 'package:field_training_app/student_features/home/data/repo/home_repo_implement.dart';
import 'package:field_training_app/student_features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:field_training_app/student_features/payment/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'package:field_training_app/student_features/payment/presentation/views/payment_option_view.dart';
import 'package:field_training_app/student_features/payment/presentation/views/ref_code_view.dart';
import 'package:field_training_app/student_features/payment/presentation/views/visa_view.dart';
import 'package:field_training_app/student_features/profile/data/repos/student_repo/student_profile_repo_implement.dart';
import 'package:field_training_app/student_features/quiz/presentation/views/quiz_view.dart';
import 'package:field_training_app/student_features/search/presentation/views/search_options_view.dart';
import 'package:field_training_app/student_features/splash/presentation/views/splash_view.dart';
import 'package:field_training_app/student_features/teacher_details_and_subjects/data/repo/teacher_details_repo_implement.dart';
import 'package:field_training_app/student_features/teacher_details_and_subjects/presentation/view_model/cubit/teacher_details_cubit.dart';
import 'package:field_training_app/student_features/teacher_details_and_subjects/presentation/views/teacher_details_view.dart';
import 'package:field_training_app/student_features/teacher_details_and_subjects/presentation/views/teacher_subjects_view.dart';
import 'package:field_training_app/teacher_features/courses/data/models/course_model.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/add_course_repo/add_Course_repo_implement.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/course_repo/course_repo_implement.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/course_details_teacher_view.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/enrolled_students_view.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/add_course_cubit/add_course_cubit.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/cubit/get_all_courses_teacher_cubit.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/repos/add_quiz_repo/add_quzi_repo_impelement.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/views/make_quiz_view.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/views/show_all_quizzes_view.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/views/show_quiz_view.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/views_model/cubit/add_quiz_cubit.dart';
import 'package:field_training_app/teacher_features/profile_teacher/data/repos/teacher_repo/student_profile_repo_implement.dart';
import 'package:field_training_app/teacher_features/profile_teacher/presentation/view_model/cubit/student_profile_cubit.dart';
import 'package:field_training_app/teacher_features/teacher/presentation/views/create_class.dart';
import 'package:field_training_app/teacher_features/teacher/presentation/views/terms_view.dart';
import 'package:field_training_app/teacher_features/teacher/presentation/views_model/cubit/drop_down_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/student_features/auth/presentation/views/login_view.dart';
import 'package:field_training_app/student_features/auth/presentation/views/register_view.dart';
import 'package:field_training_app/student_features/bottom_bar/presentation/views/custom_bottom_bar.dart';
import 'package:field_training_app/student_features/introduction_screens/presentation/views/introduction_screens.dart';
import 'package:field_training_app/student_features/profile/presentation/views/profile_edit_view.dart';
import 'package:field_training_app/student_features/search/presentation/views/search_view.dart';

import '../../student_features/auth/presentation/view_model/change_profile_image.dart';
import '../../student_features/bottom_bar/presentation/view_model/bottom_bar_cubit.dart';
import '../../student_features/chat_gpt/presentation/view_model/chat_cubit.dart';
import '../../student_features/notification/presentation/views/notification_view.dart';
import '../../student_features/profile/presentation/view_model/cubit/student_profile_cubit.dart';
import '../../student_features/profile/presentation/views/profile_select_class_edit_view.dart';
import '../../student_features/profile/presentation/views/profile_view.dart';
import '../../student_features/quiz/presentation/view_model/counter_cubit.dart';
import '../../student_features/quiz/presentation/view_model/select_answer_cubit.dart';
import '../../student_features/quiz/presentation/views/quiz_result_view.dart';
import '../../student_features/search/data/repo/search_repo_implement.dart';
import '../../student_features/search/presentation/view_model/search_cubit/search_cubit.dart';

import '../../teacher_features/bottom_bar_teacher/presentation/views/custom_bottom_bar.dart';
import '../../teacher_features/profile_teacher/presentation/views/teacher_profile_edit_view.dart';
import '../../teacher_features/profile_teacher/presentation/views/teacher_profile_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashViewRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.createClassViewRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => DropDownListCubit(),
              ),
              BlocProvider(
                create: (context) =>
                    AddCourseCubit(getIt.get<AddCourseRepoImplement>()),
              ),
            ],
            child: const CreateClassView(),
          ),
        );
      case Routes.introScreensViewRoute:
        return MaterialPageRoute(
          builder: (context) => const IntroScreens(),
        );
      case Routes.loginViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(getIt.get<AuthRepoImplement>()),
            child: const LoginView(),
          ),
        );
      case Routes.registerViewRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AuthCubit(getIt.get<AuthRepoImplement>()),
              ),
              BlocProvider(
                create: (context) => ChangeRegisterImageCubit(),
              ),
            ],
            child: const RegisterView(),
          ),
        );

      case Routes.customBottomBarViewRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => BottomBarCubit(),
              ),
              BlocProvider(
                create: (context) => ChatCubit(),
              ),
              BlocProvider(
                create: (context) => ChangeRegisterImageCubit(),
              ),
              BlocProvider(
                create: (context) => StudentProfileCubit(
                    getIt.get<StudentProfileRepoImplement>())
                  ..getStudentData(),
              ),
              BlocProvider(
                create: (context) =>
                    HomeCubit(getIt.get<HomeRepoImplement>())..getSubjects(),
              ),
              BlocProvider(
                create: (context) => FavouriteCoursesCubit(),
              ),
            ],
            child: const CustomBottomBarView(),
          ),
        );
      case Routes.customBottomBarForTeacherViewRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => BottomBarCubit(),
              ),
              BlocProvider(
                create: (context) => ChangeRegisterImageCubit(),
              ),
              BlocProvider(
                create: (context) => GetAllCoursesTeacherCubit(
                    getIt.get<CourseRepoImplement>())
                  ..getCourses(teacherId: CacheHelper.getData(key: ApiKey.id)),
              ),
              BlocProvider(
                create: (context) => ChatCubit(),
              ),
              BlocProvider(
                create: (context) => AuthCubit(getIt.get<AuthRepoImplement>()),
              ),
              BlocProvider(
                create: (context) => TeacherProfileCubit(
                    getIt.get<TeacherProfileRepoImplement>())
                  ..getTeacherData(),
              ),
            ],
            child: const CustomBottomBarForTeacherView(),
          ),
        );
      case Routes.profileViewRoute:
        return MaterialPageRoute(
          builder: (context) => const ProfileView(),
        );
      case Routes.teacherProfileViewRoute:
        return MaterialPageRoute(
          builder: (context) => const TeacherProfileView(),
        );
      case Routes.profileEditViewRoute:
        var args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                StudentProfileCubit(getIt.get<StudentProfileRepoImplement>()),
            child: ProfileEditView(
              parameter: args["parameter"],
              value: args["value"],
            ),
          ),
        );
      case Routes.teacherProfileEditViewRoute:
        var args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                TeacherProfileCubit(getIt.get<TeacherProfileRepoImplement>()),
            child: TeacherProfileEditView(
              parameter: args["parameter"],
              value: args["value"],
            ),
          ),
        );
      case Routes.profileSelectClassEditViewRoute:
        var args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                StudentProfileCubit(getIt.get<StudentProfileRepoImplement>()),
            child: ProfileSelectClassEditView(value: args),
          ),
        );
      case Routes.notificationViewRoute:
        return MaterialPageRoute(
          builder: (context) => const NotificationView(),
        );
      case Routes.searchViewRoute:
        var args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    SearchCubit(getIt.get<SearchRepoImplement>()),
              ),
              BlocProvider(
                create: (context) => OptionCubit(),
              ),
            ],
            child: SearchView(searchType: args),
          ),
        );
      case Routes.searchOptionViewRoute:
        return MaterialPageRoute(
          builder: (context) => const SearchOptionsView(),
        );
      case Routes.courseDetailsViewRoute:
        var args = settings.arguments as SubjectModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                PaymentCubit(getIt.get<PaymentApiServices>())..getAuthToken(),
            child: CourseDetailsView(subjectModel: args),
          ),
        );
      case Routes.termsViewRoute:
        return MaterialPageRoute(
          builder: (context) => TermsView(),
        );
      case Routes.courseDetailsTeacherViewRoute:
        var args = settings.arguments as CourseModel;
        return MaterialPageRoute(
          builder: (context) => CourseDetailsTeacherView(
            courseModel: args,
          ),
        );
      case Routes.enrolledStudentsViewRoute:
        return MaterialPageRoute(
          builder: (context) => const EnrolledStudentsView(),
        );
      case Routes.quizViewRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CounterCubit(),
              ),
              BlocProvider(
                create: (context) => SelectAnswerCubit(),
              ),
            ],
            child: const QuizView(),
          ),
        );
      case Routes.quizResultViewRoute:
        var args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => QuizResultView(numberOfQuestions: args),
        );
      case Routes.createQuizViewRoute:
        var args = settings.arguments as String;
        var args2 = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => MakeQuizView(
            titleQuiz: args,
            quizId: args2,
          ),
        );
      case Routes.showQuizViewRoute:
        return MaterialPageRoute(
          builder: (context) => const ShowQuizView(),
        );
      case Routes.showAllQuizzesViewRoute:
        var args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                AddQuizCubit(getIt.get<AddQuizRepoImplement>()),
            child: ShowAllQuizzesView(
              subjectId: args,
            ),
          ),
        );
      case Routes.paymentOptionViewRoute:
        return MaterialPageRoute(
          builder: (context) => const PaymentOptionView(),
        );
      case Routes.refCodeViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                PaymentCubit(getIt.get<PaymentApiServices>())..getRefCode(),
            child: const RefCodeView(),
          ),
        );
      case Routes.visaViewRoute:
        var args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => VisaView(url: args),
        );
      case Routes.teacherDetailsViewRoute:
        var args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                TeacherDetailsCubit(getIt.get<TeacherDetailsRepoImplement>())
                  ..getTeacherData(teacherID: args),
            child: const TeacherDetailsView(),
          ),
        );
      case Routes.teacherSubjectsViewRoute:
        var args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                TeacherDetailsCubit(getIt.get<TeacherDetailsRepoImplement>())
                  ..getTeacherSubjects(teacherID: args),
            child: const TeacherSubjectsView(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No Route Found!!"),
              ),
            );
          },
        );
    }
  }
}
