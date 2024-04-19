import 'package:field_training_app/student_features/auth/presentation/widgets/teacher_address_view_body.dart';
import 'package:flutter/material.dart';

class TeacherAddressView extends StatelessWidget {
  const TeacherAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: TeacherAddressViewBody()),
    );
  }
}
