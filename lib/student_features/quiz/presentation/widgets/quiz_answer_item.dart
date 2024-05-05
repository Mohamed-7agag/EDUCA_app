import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/student_features/quiz/presentation/view_model/select_answer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizAnswerItem extends StatelessWidget {
  const QuizAnswerItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: kSplashColor,
      onTap: () {
        context.read<SelectAnswerCubit>().select(text);
      },
      child: BlocBuilder<SelectAnswerCubit, String>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: state == text ? kPrimaryColor : Colors.grey),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              text,
              style: Styles.textStyle16.copyWith(color: state == text ? kPrimaryColor : Colors.black),
              textDirection: TextDirection.rtl,
            ),
          );
        },
      ),
    );
  }
}
