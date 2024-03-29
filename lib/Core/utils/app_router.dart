import 'package:field_training_app/Features/auth/presentation/views/login_view.dart';
import 'package:field_training_app/Features/auth/presentation/views/register_view.dart';
import 'package:field_training_app/Features/introduction_screens/presentation/views/introduction_screens.dart';
import 'package:field_training_app/Features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Features/auth/presentation/view_model/password_visibility/password_visibility_cubit.dart';
import '../../Features/auth/presentation/view_model/register_option_cubit.dart';

class AppRouter {
  static const String splashViewRoute = "/";
  static const String introScreensViewRoute = "/introScreensView";
  static const String loginViewRoute = "/loginView";
  static const String registerViewRoute = "/registerView";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashViewRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case introScreensViewRoute:
        return MaterialPageRoute(
          builder: (context) => const IntroScreens(),
        );
      case loginViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => PasswordVisibilityCubit(),
            child: const LoginView(),
          ),
        );
      case registerViewRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => PasswordVisibilityCubit(),
              ),
              BlocProvider(
                create: (context) => RegisterOptionCubit(),
              ),
            ],
            child: const RegisterView(),
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
