// ignore_for_file: must_be_immutable

import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/teacher_cubit.dart';
import 'package:field_training_app/student_features/auth/presentation/widgets/custom_logo.dart';
import 'package:field_training_app/student_features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherAddressViewBody extends StatelessWidget {
  TeacherAddressViewBody({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: CustomLogo()),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.r),
                  topRight: Radius.circular(35.r)),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(6, 13, 13, 13),
                  blurRadius: 2,
                  spreadRadius: 1.5,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "متابعة التسجيل",
                    style: Styles.textStyle24,
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 30.h),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: "المدينة",
                          keyboardType: TextInputType.text,
                          controller: cityController,
                        ),
                        SizedBox(height: 28.h),
                        CustomTextField(
                          hintText: "العنوان",
                          keyboardType: TextInputType.text,
                          controller: addressController,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 200.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: CustomButton(
                        text: "أنشاء",
                        onpressed: () {
                          if (formKey.currentState!.validate()) {
                            context
                                .read<TeacherCubit>()
                                .setTeacherCityAndAddress(
                                    city: cityController.text,
                                    address: addressController.text);
                            successCherryToast(
                              context,
                              "تم التسجيل بنجاح",
                              'قم بتاكيد البريد الالكتروني لتفعيل حسابك',
                            );
                            Navigator.pushNamed(context, Routes.loginViewRoute);
                          }
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
