// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/Core/widgets/custom_user_image.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/user_cubit.dart';
import 'package:field_training_app/student_features/profile/presentation/view_model/cubit/student_profile_cubit_cubit.dart';
import 'package:field_training_app/student_features/profile/presentation/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/routes.dart';
import '../../../../Core/utils/styles.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: BlocBuilder<StudentProfileCubit, StudentProfileState>(
          builder: (context, state) {
            if (state is StudentProfileSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20.h),
                  CustomUserImage(
                    radius: 55.r,
                    iconSize: 50,
                    right: 112.w,
                    top: 80.h,
                    cameraSize: 21,
                  ),
                  SizedBox(height: 25.h),
                  Text(state.studentModel.firstName ?? '',
                      style: Styles.textStyle24
                          .copyWith(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center),
                  SizedBox(height: 2.h),
                  Text(state.studentModel.email ?? '',
                      style: Styles.textStyle16, textAlign: TextAlign.center),
                  SizedBox(height: 50.h),
                  ProfileItem(
                    title: "الأسم الاول",
                    value: state.studentModel.firstName ?? '',
                    iconData: Icons.person,
                    onpressed: () {
                      Navigator.pushNamed(context, Routes.profileEditViewRoute,
                          arguments: {
                            "parameter": "name",
                            "value": state.studentModel.firstName ?? '',
                          });
                    },
                  ),
                  SizedBox(height: 28.h),
                  ProfileItem(
                    title: "الأسم الأخير",
                    value: state.studentModel.lastName ?? '',
                    iconData: Icons.person,
                    onpressed: () {
                      Navigator.pushNamed(context, Routes.profileEditViewRoute,
                          arguments: {
                            "parameter": "name",
                            "value": state.studentModel.lastName ?? '',
                          });
                    },
                  ),
                  SizedBox(height: 28.h),
                  ProfileItem(
                    title: "البريد الالكتروني",
                    value: state.studentModel.email ?? '',
                    iconData: Icons.email,
                    onpressed: () {
                      Navigator.pushNamed(context, Routes.profileEditViewRoute,
                          arguments: {
                            "parameter": "email",
                            "value": state.studentModel.email ?? '',
                          });
                    },
                  ),
                  SizedBox(height: 28.h),
                  ProfileItem(
                    title: "رقم الجوال",
                    value: state.studentModel.phone ?? '',
                    iconData: Icons.phone_android_rounded,
                    onpressed: () {
                      Navigator.pushNamed(context, Routes.profileEditViewRoute,
                          arguments: {
                            "parameter": "phone",
                            "value": state.studentModel.phone ?? '',
                          });
                    },
                  ),
                  SizedBox(height: 28.h),
                  ProfileItem(
                    title: "الصف الدراسي",
                    value: state.studentModel.level ?? '',
                    iconData: Icons.school,
                    onpressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.profileSelectClassEditViewRoute,
                        arguments: state.studentModel.level ?? '',
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
            } else if (state is StudentProfileFailure) {
              return Center(child: Text(state.errMessage));
            }

            return const CustomLoadingWidget();
          },
        ),
      ),
    );
  }
}
