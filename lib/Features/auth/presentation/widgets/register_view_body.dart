import 'package:field_training_app/Core/utils/app_router.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../view_model/password_visibility/password_visibility_cubit.dart';
import '../view_model/register_option_cubit.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 75.w,
                  ),
                  SizedBox(width: 10.w),
                  Text("EDUCA", style: GoogleFonts.lilitaOne(fontSize: 38.sp))
                ],
              ),
            ],
          ),
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
                    "أنشاء حساب",
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
                        SizedBox(height: 28.h),
                        const CustomTextField(
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
                    builder: (context, state) {
                      return Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: RadioListTile(
                              value: "معلم",
                              visualDensity: VisualDensity.compact,
                              selectedTileColor: kPrimaryColor,
                              activeColor: kPrimaryColor,
                              controlAffinity: ListTileControlAffinity.trailing,
                              selected: state == "معلم" ? true : false,
                              contentPadding: const EdgeInsets.all(0),
                              title: Text("معلم",
                                  style: Styles.textStyle16,
                                  textAlign: TextAlign.right),
                              groupValue: state,
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
                              controlAffinity: ListTileControlAffinity.trailing,
                              activeColor: kPrimaryColor,
                              selected: state == "طالب" ? true : false,
                              contentPadding: const EdgeInsets.all(0),
                              title: Text("طالب",
                                  style: Styles.textStyle16,
                                  textAlign: TextAlign.right),
                              groupValue: state,
                              onChanged: (value) {
                                context
                                    .read<RegisterOptionCubit>()
                                    .changeRegisterOption(0);
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(text: "أنشاء", onpressed: () {}),
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
