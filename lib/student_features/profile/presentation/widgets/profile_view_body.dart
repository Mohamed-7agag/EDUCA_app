// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_user_image.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/user_cubit.dart';
import 'package:field_training_app/student_features/profile/presentation/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/models/user_model.dart';
import '../../../../Core/utils/routes.dart';
import '../../../../Core/utils/styles.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: BlocBuilder<UserCubit, UserModel>(
          builder: (context, student) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.h),
                CustomUserImage(
                  user: student,
                  radius: 55.r,
                  iconSize: 50,
                  right: 112.w,
                  top: 80.h,
                  cameraSize: 21,
                ),
                SizedBox(height: 25.h),
                Text(student.name ?? '',
                    style: Styles.textStyle24
                        .copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center),
                SizedBox(height: 2.h),
                Text(student.email ?? '',
                    style: Styles.textStyle16, textAlign: TextAlign.center),
                SizedBox(height: 50.h),
                ProfileItem(
                  title: "الأسم",
                  value: student.name ?? '',
                  iconData: Icons.person,
                  onpressed: () {
                    Navigator.pushNamed(context, Routes.profileEditViewRoute,
                        arguments: {
                          "parameter": "name",
                          "value": student.name ?? '',
                        });
                  },
                ),
                SizedBox(height: 28.h),
                ProfileItem(
                  title: "البريد الالكتروني",
                  value: student.email ?? '',
                  iconData: Icons.email,
                  onpressed: () {
                    Navigator.pushNamed(context, Routes.profileEditViewRoute,
                        arguments: {
                          "parameter": "email",
                          "value": student.email ?? '',
                        });
                  },
                ),
                SizedBox(height: 28.h),
                ProfileItem(
                  title: "كلمة المرور",
                  value: student.password ?? '',
                  iconData: Icons.lock,
                  onpressed: () {
                    Navigator.pushNamed(context, Routes.profileEditViewRoute,
                        arguments: {
                          "parameter": "password",
                          "value": student.password ?? '',
                        });
                  },
                ),
                SizedBox(height: 28.h),
                ProfileItem(
                  title: "رقم الجوال",
                  value: student.phone ?? '',
                  iconData: Icons.phone_android_rounded,
                  onpressed: () {
                    Navigator.pushNamed(context, Routes.profileEditViewRoute,
                        arguments: {
                          "parameter": "phone",
                          "value": student.phone ?? '',
                        });
                  },
                ),
                SizedBox(height: 28.h),
                ProfileItem(
                  title: "الصف الدراسي",
                  value: student.studentLevel ?? '',
                  iconData: Icons.school,
                  onpressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.profileSelectClassEditViewRoute,
                      arguments: student.studentLevel ?? '',
                    );
                  },
                ),
                SizedBox(height: 30.h),
                CustomButton(
                    text: "تسجيل الخروج",
                    onpressed: () {
                      BlocProvider.of<UserCubit>(context).logout();
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.loginViewRoute, (route) => false);
                    }),
                SizedBox(height: 15.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
