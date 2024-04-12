import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Features/auth/data/models/student_model.dart';
import 'package:field_training_app/Features/auth/presentation/view_model/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'course_item.dart';
import 'home_search_text_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
              child: BlocBuilder<StudentCubit, Student>(
                builder: (context, student) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.profileViewRoute);
                            },
                            child: CircleAvatar(
                              radius: 22.r,
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
                      student.name!.length <= 10 ?
                      Text(
                        "مرحبا, ${student.name}",
                        textDirection: TextDirection.rtl,
                        style: Styles.textStyle24,
                      ) : Text(
                        "مرحبا, ${student.name!.substring(0,10)}..",
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
                "ما الذي تريد تعلمه اليوم؟",
                textDirection: TextDirection.rtl,
                style: Styles.textStyle14.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(height: 20.h),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: HomeSearchTextFormField(),
            ),
            SizedBox(height: 30.h),
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
              height: 200.h,
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
            SizedBox(height: 30.h),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "كورسات موصي بها",
                textDirection: TextDirection.rtl,
                style: Styles.textStyle16,
              ),
            ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 200.h,
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
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
