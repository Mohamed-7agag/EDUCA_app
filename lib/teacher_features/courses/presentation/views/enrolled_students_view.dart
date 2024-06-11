import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/enrolled_students_view_body.dart';
import 'package:flutter/material.dart';

class EnrolledStudentsView extends StatelessWidget {
  const EnrolledStudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الطلاب المشتركين',
          style: Styles.textStyle20.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      backgroundColor: Colors.white,
      body:const SafeArea(child: EnrolledStudentsViewBody()),
    );
  }
}
