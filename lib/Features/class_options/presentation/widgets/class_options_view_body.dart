// ignore_for_file: must_be_immutable

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:field_training_app/Features/class_options/data/class_option_data.dart';
import 'package:field_training_app/Features/class_options/presentation/view_model/class_options_cubit.dart';
import 'package:field_training_app/Features/class_options/presentation/widgets/custom_class_options_item.dart';
import 'package:field_training_app/Features/class_options/presentation/widgets/custom_class_options_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/routes.dart';
import '../../../../Core/widgets/custom_button.dart';
import '../../../auth/presentation/view_model/student_cubit.dart';

class ClassOptionsViewBody extends StatelessWidget {
  ClassOptionsViewBody({super.key});
  int selectedIdx = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomClassOptionsShape(text: "أختر الصف الدراسي"),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 590.h,
                child: ListView.builder(
                  itemCount: classOptionsValues.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: CustomClassOptionsItem(
                        text: classOptionsValues[index],
                        index: index,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
              BlocListener<ClassOptionsCubit, int>(
                listener: (context, state) {
                  selectedIdx = state;
                },
                child: CustomButton(
                    text: "لنبدا التعلم",
                    onpressed: () {
                      if (selectedIdx != -1) {
                        context.read<StudentCubit>().setStudentClass(
                            studentClass: classOptionsValues[selectedIdx]);

                        Navigator.pushNamed(
                            context, Routes.customBottomBarViewRoute);
                      } else {
                        CherryToast.error(
                          title: const Text("حدث خطأ"),
                          layout: ToastLayout.rtl,
                          description: const Text("أختر الصف الدراسي"),
                          animationType: AnimationType.fromTop,
                          animationDuration: const Duration(milliseconds: 1000),
                          autoDismiss: true,
                          width: MediaQuery.of(context).size.width - 80.w,
                        ).show(context);
                      }
                    }),
              )
            ],
          ),
        ),
      ],
    );
  }
}
