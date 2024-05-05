import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizAnswerItem extends StatelessWidget {
  const QuizAnswerItem({super.key, required this.text});

final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Text(
         text,
          style: Styles.textStyle16,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
