// ignore_for_file: must_be_immutable
import 'package:field_training_app/Core/models/student_model.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/student_features/auth/helper/register_validation.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/student_cubit.dart';
import 'package:field_training_app/student_features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/routes.dart';
import '../../../profile/presentation/widgets/bottom_sheet.dart';
import '../view_model/password_visibility/password_visibility_cubit.dart';
import '../view_model/register_option_cubit.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.h),
            Text(
              "أنشاء حساب جديد",
              style: Styles.textStyle22,
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 25.h),
            BlocBuilder<StudentCubit, StudentModel>(
              builder: (context, student) {
                return Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        border: student.image == null
                            ? null
                            : Border.all(color: kPrimaryColor, width: 2),
                      ),
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundColor: kSplashColor,
                        backgroundImage: student.image == null
                            ? null
                            : FileImage(student.image!),
                        child: student.image == null
                            ? Icon(
                                Icons.person,
                                size: 45.sp,
                                color: kPrimaryColor,
                              )
                            : null,
                      ),
                    ),
                    Positioned(
                      right: 115.w,
                      top: 70.h,
                      child: IconButton(
                        onPressed: () {
                          bottomSheet(context);
                        },
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 35.h),
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: nameController,
                    hintText: "الأسم (باللغة العربية)",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 25.h),
                  CustomTextField(
                    controller: emailController,
                    hintText: "البريد الالكتروني",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 25.h),
                  BlocBuilder<PasswordVisibilityCubit, bool>(
                    builder: (context, state) {
                      return CustomTextField(
                        controller: passwordController,
                        hintText: "كلمة السر",
                        obscureText: state,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            context
                                .read<PasswordVisibilityCubit>()
                                .changeState();
                          },
                          icon: state == true
                              ? const Icon(Icons.visibility_rounded,
                                  color: kPrimaryColor)
                              : const Icon(Icons.visibility_off_rounded,
                                  color: kPrimaryColor),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 25.h),
                  CustomTextField(
                    controller: phoneController,
                    hintText: "رقم الجوال",
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 25.h),
                  CustomTextField(
                    controller: addressController,
                    hintText: "العنوان (اختياري)",
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.h),
            Text(
              "التسجيل ك",
              style: Styles.textStyle16,
              textAlign: TextAlign.right,
            ),
            BlocProvider(
              create: (context) => RegisterOptionCubit(),
              child: BlocBuilder<RegisterOptionCubit, String>(
                builder: (context, optionState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: RadioListTile(
                              value: "معلم",
                              visualDensity: VisualDensity.compact,
                              activeColor: kPrimaryColor,
                              controlAffinity: ListTileControlAffinity.trailing,
                              selected: optionState == "معلم" ? true : false,
                              contentPadding: const EdgeInsets.all(0),
                              title: Text("معلم",
                                  style: Styles.textStyle16,
                                  textAlign: TextAlign.right),
                              groupValue: optionState,
                              onChanged: (value) {
                                context
                                    .read<RegisterOptionCubit>()
                                    .changeRegisterOption(1);
                              },
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: RadioListTile(
                              value: "طالب",
                              visualDensity: VisualDensity.compact,
                              controlAffinity: ListTileControlAffinity.trailing,
                              activeColor: kPrimaryColor,
                              selected: optionState == "طالب" ? true : false,
                              contentPadding: const EdgeInsets.all(0),
                              title: Text("طالب",
                                  style: Styles.textStyle16,
                                  textAlign: TextAlign.right),
                              groupValue: optionState,
                              onChanged: (value) {
                                context
                                    .read<RegisterOptionCubit>()
                                    .changeRegisterOption(0);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 28.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomButton(
                            text: optionState == "طالب" ? "أنشاء" : "التالي",
                            onpressed: () {
                              if (formKey.currentState!.validate()) {
                                registerValidation(
                                  context,
                                  optionState,
                                  nameController,
                                  emailController,
                                  phoneController,
                                  passwordController,
                                  addressController,
                                );
                              }
                            }),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.loginViewRoute);
                  },
                  child: Text(
                    "تسجيل",
                    style: Styles.textStyle16.copyWith(
                        fontSize: 15.sp,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Text(" لديك بالفعل حساب ؟"),
              ],
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
