import 'package:field_training_app/Core/utils/app_router.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Features/auth/presentation/widgets/custom_logo.dart';
import 'package:field_training_app/Features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view_model/password_visibility/password_visibility_cubit.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: CustomLogo(),
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              boxShadow: [
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
                    "تسجيل الدخول",
                    style: Styles.textStyle24,
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 30.h),
                  Form(
                    child: Column(
                      children: [
                        const CustomTextField(
                          hintText: "البريد الالكتروني",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 28.h),
                        BlocBuilder<PasswordVisibilityCubit, bool>(
                          builder: (context, state) {
                            return CustomTextField(
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
                                    ? const Icon(Icons.visibility_rounded)
                                    : const Icon(Icons.visibility_off_rounded),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "نسيت كلمة السر ؟",
                    style: Styles.textStyle14,
                  ),
                  SizedBox(height: 50.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                        text: "تسجيل",
                        onpressed: () {
                          Navigator.pushNamed(
                              context, AppRouter.classOptionsViewRoute);
                        }),
                  ),
                  SizedBox(height: 25.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRouter.registerViewRoute);
                        },
                        child: Text(
                          "أنشاء",
                          style: Styles.textStyle16.copyWith(
                              fontSize: 15.sp,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Text(" ليس لديك حساب ؟"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
