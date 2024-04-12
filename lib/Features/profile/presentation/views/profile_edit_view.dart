// ignore_for_file: must_be_immutable
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Features/auth/presentation/view_model/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/styles.dart';

class ProfileEditView extends StatelessWidget {
  ProfileEditView({super.key, required this.value, required this.parameter});

  String value;
  final String parameter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "تعديل بيانات الطالب",
                style: Styles.textStyle24.copyWith(
                    fontWeight: FontWeight.bold, color: kPrimaryColor),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 50.h),
              TextFormField(
                onChanged: (val) {
                  value = val;
                },
                cursorColor: kPrimaryColor,
                cursorErrorColor: Colors.red,
                initialValue: value,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: kPrimaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                    text: "تعديل",
                    onpressed: () {
                      if (value.isEmpty) {
                        CherryToast.error(
                          title: const Text("حدث خطأ"),
                          layout: ToastLayout.rtl,
                          description: const Text("قم بتعبئة هذا الحقل"),
                          animationType: AnimationType.fromTop,
                          animationDuration: const Duration(milliseconds: 1000),
                          autoDismiss: true,
                          width: MediaQuery.of(context).size.width - 80.w,
                        ).show(context);
                      } else {
                        context
                            .read<StudentCubit>()
                            .updateData(parameter, value);
                        Navigator.pop(context);
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
