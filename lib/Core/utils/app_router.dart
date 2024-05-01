import 'package:field_training_app/Core/utils/app_services.dart';
import 'package:field_training_app/student_features/auth/data/repos/auth_repo_implement.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:field_training_app/student_features/profile/data/repos/student_profile_repo_implement.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/course_details_teacher_view.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/enrolled_students_view.dart';
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
import 'package:field_training_app/student_features/my_courses/presentation/view_model/favourite_courses_cubit.dart';
import 'package:field_training_app/student_features/my_courses/presentation/views/course_details_view.dart';
import 'package:field_training_app/student_features/profile/presentation/views/profile_edit_view.dart';
import 'package:field_training_app/student_features/search/presentation/views/search_view.dart';

import '../../student_features/auth/presentation/view_model/change_profile_image.dart';
import '../../student_features/bottom_bar/presentation/view_model/bottom_bar_cubit.dart';
import '../../student_features/notification/presentation/views/notification_view.dart';
import '../../student_features/profile/presentation/view_model/cubit/student_profile_cubit.dart';
import '../../student_features/profile/presentation/views/profile_select_class_edit_view.dart';
import '../../student_features/profile/presentation/views/profile_view.dart';
import '../../student_features/splash/presentation/views/splash_view.dart';
import '../../teacher_features/bottom_bar_teacher/presentation/views/custom_bottom_bar.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashViewRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.createClassViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DropDownListCubit(),
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
                create: (context) => ChangeProfileImageCubit(),
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
                create: (context) => ChangeProfileImageCubit(),
              ),
              BlocProvider(
                create: (context) => StudentProfileCubit(
                    getIt.get<StudentProfileRepoImplement>())
                  ..getStudentData(),
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
            ],
            child: const CustomBottomBarForTeacherView(),
          ),
        );
      case Routes.profileViewRoute:
        return MaterialPageRoute(
          builder: (context) => const ProfileView(),
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
      case Routes.profileSelectClassEditViewRoute:
        var args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ProfileSelectClassEditView(value: args),
        );
      case Routes.notificationViewRoute:
        return MaterialPageRoute(
          builder: (context) => const NotificationView(),
        );
      case Routes.searchViewRoute:
        return MaterialPageRoute(
          builder: (context) => const SearchView(),
        );
      case Routes.courseDetailsViewRoute:
        return MaterialPageRoute(
          builder: (context) => const CourseDetailsView(),
        );
      case Routes.termsViewRoute:
        return MaterialPageRoute(
          builder: (context) => TermsView(),
        );
        case Routes.courseDetailsTeacherViewRoute:
        return MaterialPageRoute(
          builder: (context) => const CourseDetailsTeacherView(),
        );
      case Routes.enrolledStudentsViewRoute:
        return MaterialPageRoute(
          builder: (context) => const EnrolledStudentsView(),
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
