// ignore_for_file: must_be_immutable
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:field_training_app/student_features/auth/helper/register_validation.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/class_option_cubit.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/user_cubit.dart';
import 'package:field_training_app/student_features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Core/models/user_model.dart';
import '../../../../Core/utils/routes.dart';
import '../../../../Core/widgets/custom_user_image.dart';
import '../view_model/password_visibility/password_visibility_cubit.dart';
import '../view_model/register_option_cubit.dart';
import 'class_option_values.dart';
import 'custom_radio_list_tile.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String studentLevel = '';

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
            BlocBuilder<UserCubit, UserModel>(
              builder: (context, user) {
                return CustomUserImage(
                  user: user,
                  radius: 50.r,
                  cameraSize: 20,
                  iconSize: 45,
                  right: 115.w,
                  top: 70.h,
                );
              },
            ),
            SizedBox(height: 40.h),
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
                  SizedBox(height: 28.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "التسجيل ك",
                      style: Styles.textStyle16,
                    ),
                  ),
                  BlocProvider(
                    create: (context) => RegisterOptionCubit(),
                    child: BlocBuilder<RegisterOptionCubit, String>(
                      builder: (context, optionState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: CustomRadioListTile(
                                      optionState: optionState,
                                      value: "معلم",
                                      index: 1),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: CustomRadioListTile(
                                      optionState: optionState,
                                      value: "طالب",
                                      index: 0),
                                ),
                              ],
                            ),
                            SizedBox(height: 14.h),
                            optionState == "طالب"
                                ? BlocProvider(
                                    create: (context) => ClassOptionCubit(),
                                    child:
                                        BlocBuilder<ClassOptionCubit, String>(
                                      builder: (context, classOptionState) {
                                        return DropdownButton(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          underline: Container(
                                              height: 1, color: Colors.grey),
                                          icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: kPrimaryColor,
                                              size: 30),
                                          alignment: Alignment.centerRight,
                                          style: Styles.textStyle16
                                              .copyWith(color: Colors.black),
                                          elevation: 1,
                                          hint: Text(
                                            classOptionState,
                                            style: GoogleFonts.tajawal(
                                                fontSize: 13.sp),
                                          ),
                                          onChanged: (val) {
                                            context
                                                .read<ClassOptionCubit>()
                                                .changeState(val.toString());
                                            studentLevel = classOptionState;
                                          },
                                          isExpanded: true,
                                          items: classOptionsValues
                                              .map<DropdownMenuItem<String>>(
                                            (String value) {
                                              return DropdownMenuItem<String>(
                                                alignment:
                                                    Alignment.centerRight,
                                                value: value,
                                                child: Text(value,
                                                    style:
                                                        GoogleFonts.tajawal()),
                                              );
                                            },
                                          ).toList(),
                                        );
                                      },
                                    ),
                                  )
                                : optionState == "معلم"
                                    ? CustomTextField(
                                        controller: addressController,
                                        hintText: "العنوان",
                                        keyboardType: TextInputType.text,
                                      )
                                    : const SizedBox.shrink(),
                            SizedBox(height: 35.h),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              //? use bloc builder here
                              child: CustomButton(
                                  text: "أنشاء",
                                  onpressed: () {
                                    // if (optionState == "طالب") {
                                    //   CacheHelper.saveData(
                                    //       key: optionStateKey,
                                    //       value: optionState);
                                    //   context
                                    //       .read<AuthCubit>()
                                    //       .studentRegister();
                                    // } else if (optionState == "معلم") {
                                    //   CacheHelper.saveData(
                                    //       key: optionStateKey,
                                    //       value: optionState);
                                    //   context
                                    //       .read<AuthCubit>()
                                    //       .teacherRegister();
                                    // } else {
                                    //   errorCherryToast(context, "حدث خطأ",
                                    //       "يرجى تحديد نوع المستخدم");
                                    // }
                                    if (formKey.currentState!.validate() &&
                                        optionState != "") {
                                      registerValidation(
                                        context,
                                        optionState,
                                        nameController,
                                        emailController,
                                        phoneController,
                                        passwordController,
                                        studentLevel,
                                      );
                                    }
                                  }),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
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
