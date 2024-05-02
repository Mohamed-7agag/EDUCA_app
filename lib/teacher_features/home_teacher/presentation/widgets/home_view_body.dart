import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/models/user_model.dart';
import 'course_item.dart';

class HomeTeacherViewBody extends StatelessWidget {
  const HomeTeacherViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 15.h),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: BlocBuilder<UserCubit, UserModel>(
                builder: (context, student) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 21.5.r,
                            backgroundColor: kSplashColor,
                            backgroundImage: student.image == null
                                ? null
                                : FileImage(student.image!),
                            child: student.image == null
                                ? const Icon(
                                    Icons.person,
                                    size: 25,
                                    color: kPrimaryColor,
                                  )
                                : null,
                          ),
                          SizedBox(width: 8.w),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications_outlined,
                              color: kPrimaryColor,
                              size: 28,
                            ),
                            style: IconButton.styleFrom(
                                backgroundColor: kSplashColor),
                          ),
                        ],
                      ),
                      student.name!.length <= 10
                          ? Text(
                              "مرحبا, ${student.name}",
                              textDirection: TextDirection.rtl,
                              style: Styles.textStyle24,
                            )
                          : Text(
                              "مرحبا, ${student.name!.substring(0, 10)}..",
                              textDirection: TextDirection.rtl,
                              style: Styles.textStyle24,
                            ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "ما تريد ان تعلم اليوم؟",
                textDirection: TextDirection.rtl,
                style: Styles.textStyle14.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "الكورسات الاخيرة",
                textDirection: TextDirection.rtl,
                style: Styles.textStyle16,
              ),
            ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 230.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: CourseItem(),
                  );
                },
              ),
            ),
            SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: CustomButton(
                    text: "اضافة المادة",
                    onpressed: () {
                      Navigator.pushNamed(context, Routes.createClassViewRoute);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
