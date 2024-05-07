import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/student_features/quiz/presentation/view_model/select_answer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizAnswerItem extends StatelessWidget {
  const QuizAnswerItem({super.key, required this.text, required this.questionIndex});

  final String text;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: kSplashColor,
      onTap: () {
        context.read<SelectAnswerCubit>().setAnswer(questionIndex, text);
      },
      child: BlocBuilder<SelectAnswerCubit, List<String>>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
            width: double.infinity,
            decoration: BoxDecoration(
              border: state[questionIndex] == text
                  ? Border.all(color: kPrimaryColor, width: 1.3)
                  : Border.all(color: Colors.grey),
              borderRadius: state[questionIndex] == text
                  ? BorderRadius.circular(8.r)
                  : BorderRadius.circular(6.r),
            ),
            child: Text(
              text,
              style: Styles.textStyle16.copyWith(
                  color: state[questionIndex] == text ? kPrimaryColor : Colors.black),
              textDirection: TextDirection.rtl,
            ),
          );
        },
      ),
    );
  }
}
