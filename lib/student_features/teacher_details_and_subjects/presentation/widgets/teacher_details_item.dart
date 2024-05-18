import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherDetailsItem extends StatelessWidget {
  const TeacherDetailsItem(
      {super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: Styles.textStyle18,
        ),
        SizedBox(width: 12.w),
        Icon(
          icon,
          color: kPrimaryColor,
          size: 30,
        ),
      ],
    );
  }
}
