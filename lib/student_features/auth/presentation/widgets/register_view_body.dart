// ignore_for_file: must_be_immutable
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/student_features/auth/helper/register_validation.dart';
import 'package:field_training_app/student_features/auth/presentation/widgets/custom_logo.dart';
import 'package:field_training_app/student_features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/routes.dart';
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
          flex: 4,
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
                          hintText: "الأسم (باللغة العربية)",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 28.h),
                        CustomTextField(
                          controller: emailController,
                          hintText: "البريد الالكتروني",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 28.h),
                        BlocProvider(
                          create: (context) => PasswordVisibilityCubit(),
                          child: BlocBuilder<PasswordVisibilityCubit, bool>(
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
                            SizedBox(height: 35.h),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: CustomButton(
                                  text: "أنشاء",
                                  onpressed: () {
                                    if (formKey.currentState!.validate()) {
                                      registerValidation(
                                          context,
                                          optionState,
                                          nameController,
                                          emailController,
                                          phoneController,
                                          passwordController);
                                    }
                                  }),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 25.h),
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
