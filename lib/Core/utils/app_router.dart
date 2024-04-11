import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Features/auth/presentation/views/login_view.dart';
import 'package:field_training_app/Features/auth/presentation/views/register_view.dart';
import 'package:field_training_app/Features/bottom_bar/presentation/views/custom_bottom_bar.dart';
import 'package:field_training_app/Features/class_options/presentation/views/class_options_view.dart';
import 'package:field_training_app/Features/class_options/presentation/views/selected_class_options_view.dart';
import 'package:field_training_app/Features/introduction_screens/presentation/views/introduction_screens.dart';
import 'package:field_training_app/Features/profile/presentation/views/profile_edit_view.dart';
import 'package:field_training_app/Features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Features/bottom_bar/presentation/view_model/bottom_bar_cubit.dart';
import '../../Features/class_options/presentation/view_model/class_options_cubit.dart';
import '../../Features/profile/presentation/views/profile_select_class_edit_view.dart';
import '../../Features/profile/presentation/views/profile_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashViewRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.introScreensViewRoute:
        return MaterialPageRoute(
          builder: (context) => const IntroScreens(),
        );
      case Routes.loginViewRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case Routes.registerViewRoute:
        return MaterialPageRoute(
          builder: (context) => const RegisterView(),
        );
      case Routes.classOptionsViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ClassOptionsCubit(),
            child: const ClassOptionsView(),
          ),
        );
      case Routes.selectedClassOptionsViewRoute:
        var args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ClassOptionsCubit(),
            child: SelectedClassOptionsView(index: args),
          ),
        );
      case Routes.customBottomBarViewRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => BottomBarCubit(),
              ),
            ],
            child: const CustomBottomBar(),
          ),
        );
      case Routes.profileViewRoute:
        return MaterialPageRoute(
          builder: (context) => const ProfileView(),
        );
      case Routes.profileEditViewRoute:
        var args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => ProfileEditView(
            parameter: args["parameter"],
            value: args["value"],
          ),
        );
      case Routes.profileSelectClassEditViewRoute:
        var args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ProfileSelectClassEditView(value: args),
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
