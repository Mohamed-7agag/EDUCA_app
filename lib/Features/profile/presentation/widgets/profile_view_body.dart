// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously
import 'dart:io';
import 'package:field_training_app/Core/utils/app_router.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Features/profile/presentation/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/styles.dart';
import '../view_model/change_profile_image_cubit.dart';
import 'bottom_sheet.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 35.h),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                BlocBuilder<ProfileImageCubit, File?>(
                  builder: (context, imageState) {
                    return CircleAvatar(
                      radius: 55.r,
                      backgroundColor: Colors.grey[300],
                      backgroundImage:
                          imageState == null ? null : FileImage(imageState),
                    );
                  },
                ),
                Positioned(
                  right: 115.w,
                  top: 75.h,
                  child: IconButton(
                    onPressed: () async {
                      bottomSheet(context);
                    },
                    icon: const Icon(
                      Icons.add_a_photo_outlined,
                      color: kPrimaryColor,
                      size: 22,
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.grey[200],
                        ),
                        padding:
                            const MaterialStatePropertyAll(EdgeInsets.all(8))),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            Text("Christina Angela",
                style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center),
            SizedBox(height: 5.h),
            Text("christina.angela123@mail.com",
                style: Styles.textStyle16, textAlign: TextAlign.center),
            SizedBox(height: 60.h),
            ProfileItem(
              title: "الأسم",
              value: "Christina Angela",
              iconData: Icons.person,
              onpressed: () {
                Navigator.pushNamed(context, AppRouter.profileEditViewRoute);
              },
            ),
            SizedBox(height: 32.h),
            ProfileItem(
              title: "البريد الالكتروني",
              value: "christina.angela123@mail.com",
              iconData: Icons.email,
              onpressed: () {},
            ),
            SizedBox(height: 32.h),
            ProfileItem(
              title: "كلمة المرور",
              value: "**********",
              iconData: Icons.lock,
              onpressed: () {},
            ),
            SizedBox(height: 32.h),
            ProfileItem(
              title: "رقم الجوال",
              value: "01203435611",
              iconData: Icons.phone_android_sharp,
              onpressed: () {},
            ),
            SizedBox(height: 32.h),
            ProfileItem(
              title: "الصف الدراسي",
              value: "الصف الاول الثانوي",
              iconData: Icons.class_,
              onpressed: () {},
            ),
            SizedBox(height: 50.h),
            CustomButton(text: "تسجيل الخروج", onpressed: () {}),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
