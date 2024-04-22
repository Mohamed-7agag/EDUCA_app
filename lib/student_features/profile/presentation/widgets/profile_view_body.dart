// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/models/student_model.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/student_cubit.dart';
import 'package:field_training_app/student_features/profile/presentation/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/routes.dart';
import '../../../../Core/utils/styles.dart';
import 'bottom_sheet.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: BlocBuilder<StudentCubit, StudentModel>(
          builder: (context, student) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16.h),
                Stack(
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
                        radius: 55.r,
                        backgroundColor: kSplashColor,
                        backgroundImage: student.image == null
                            ? null
                            : FileImage(student.image!),
                        child: student.image == null
                            ? const Icon(
                                Icons.person,
                                size: 50,
                                color: kPrimaryColor,
                              )
                            : null,
                      ),
                    ),
                    Positioned(
                      right: 112.w,
                      top: 80.h,
                      child: IconButton(
                        onPressed: () async {
                          bottomSheet(context);
                        },
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.white,
                          size: 22,
                        ),
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              kPrimaryColor,
                            ),
                            padding:
                                MaterialStatePropertyAll(EdgeInsets.all(8))),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                Text(student.name ?? '',
                    style: Styles.textStyle24
                        .copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center),
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
                  value: student.studentClass ?? '',
                  iconData: Icons.school,
                  onpressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.profileSelectClassEditViewRoute,
                      arguments: student.studentClass ?? '',
                    );
                  },
                ),
                SizedBox(height: 35.h),
                CustomButton(
                    text: "تسجيل الخروج",
                    onpressed: () {
                      BlocProvider.of<StudentCubit>(context).logout();
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
