// ignore_for_file: must_be_immutable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:field_training_app/Core/utils/app_regex.dart';
import 'package:field_training_app/Core/utils/app_router.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Features/auth/presentation/view_model/student_cubit.dart';
import 'package:field_training_app/Features/auth/presentation/widgets/custom_logo.dart';
import 'package:field_training_app/Features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../view_model/password_visibility/password_visibility_cubit.dart';
import '../view_model/register_option_cubit.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: CustomLogo(),
        ),
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.r),
                  topRight: Radius.circular(35.r)),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(9, 158, 158, 158),
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
                    "أنشاء حساب",
                    style: Styles.textStyle24,
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 30.h),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: nameController,
                          hintText: "أسم المستخدم",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 28.h),
                        CustomTextField(
                          controller: emailController,
                          hintText: "البريد الالكتروني",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 28.h),
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
                        SizedBox(height: 28.h),
                        CustomTextField(
                          controller: phoneController,
                          hintText: "رقم الجوال",
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "التسجيل ك",
                    style: Styles.textStyle16,
                    textAlign: TextAlign.right,
                  ),
                  BlocBuilder<RegisterOptionCubit, String>(
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
                                  selectedTileColor: kPrimaryColor,
                                  activeColor: kPrimaryColor,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  selected:
                                      optionState == "معلم" ? true : false,
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
                                  selectedTileColor: kPrimaryColor,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  activeColor: kPrimaryColor,
                                  selected:
                                      optionState == "طالب" ? true : false,
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
                          SizedBox(height: 25.h),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomButton(
                                text: "أنشاء",
                                onpressed: () {
                                  if (formKey.currentState!.validate()) {
                                    if (!isRegisterValid(
                                        emailController.text,
                                        passwordController.text,
                                        phoneController.text)) {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.error,
                                        animType: AnimType.rightSlide,
                                        title: 'حدث خطأ',
                                        desc: 'تأكد من البيانات المدخلة',
                                        btnOkText: "حسنا",
                                        btnCancelText: "اغلاق",
                                        btnOkOnPress: () {},
                                        btnCancelOnPress: () {},
                                      ).show();
                                    } else {
                                      context
                                          .read<StudentCubit>()
                                          .setStudentData(
                                              name: nameController.text,
                                              email: emailController.text,
                                              phone: phoneController.text,
                                              password: passwordController.text,
                                              studentOrTeacher: optionState);
                                      Navigator.pushNamed(
                                          context, AppRouter.loginViewRoute);
                                    }
                                  }
                                }),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 25.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRouter.loginViewRoute);
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
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

bool isRegisterValid(String email, String password, String phone) {
  return AppRegex.isEmailValid(email) &&
      AppRegex.hasMinLength(password) &&
      AppRegex.isPhoneNumberValid(phone);
}
