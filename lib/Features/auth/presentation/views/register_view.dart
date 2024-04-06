import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Features/auth/presentation/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(child: RegisterViewBody()),
    );
  }
}
