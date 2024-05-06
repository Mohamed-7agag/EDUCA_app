import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/student_features/quiz/presentation/view_model/counter_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/routes.dart';
import 'question_and_answers.dart';

class QuizViewBody extends StatelessWidget {
  QuizViewBody({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 60.h),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 150.h,
                  child: PageView.builder(
                    reverse: true,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      return QuestionAndAnswer(
                        question: questions[index],
                        answers: answers[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 20.h,
          right: 20.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocBuilder<CounterCubit, double>(
                builder: (context, state) {
                  return Text((state.toInt() + 1).toString(),
                      style: Styles.textStyle22.copyWith(color: kPrimaryColor));
                },
              ),
              Text(" / ${questions.length}", style: Styles.textStyle16),
            ],
          ),
        ),
        Positioned(
          bottom: 20.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: "التالي",
                onpressed: () {
                  if (_controller.page! < questions.length - 1) {
                    _controller
                        .nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.ease,
                        )
                        .then((value) => context
                            .read<CounterCubit>()
                            .increment(_controller.page!));
                  } else {
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.quizResultViewRoute,
                    );
                  }
                },
                textStyle:
                    Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
                padding: EdgeInsets.only(
                    left: 24.w, right: 24.w, top: 8.h, bottom: 5.h),
              ),
              SizedBox(width: 150.w),
              CustomButton(
                text: "السابق",
                onpressed: () {
                  if (_controller.page! > 0) {
                    _controller
                        .previousPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.ease,
                        )
                        .then((value) => context
                            .read<CounterCubit>()
                            .decrement(_controller.page!));
                  }
                },
                textStyle:
                    Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, top: 7.h, bottom: 5.h),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
