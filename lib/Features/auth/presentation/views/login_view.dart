import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Features/auth/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(child: LoginViewBody()),
    );
  }
}
