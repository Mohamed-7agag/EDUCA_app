import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'course_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Routes.notificationViewRoute);
                      },
                      icon: const Icon(
                        Icons.notifications_outlined,
                        color: kPrimaryColor,
                        size: 28,
                      ),
                      style:
                          IconButton.styleFrom(backgroundColor: kSplashColor),
                    ),
                    SizedBox(width: 8.w),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.searchViewRoute);
                      },
                      icon: const Icon(
                        Icons.search_rounded,
                        color: kPrimaryColor,
                        size: 28,
                      ),
                      style:
                          IconButton.styleFrom(backgroundColor: kSplashColor),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child:
                          Image.asset("assets/images/welcome2.png", width: 31.w),
                    ),
                    SizedBox(width: 10.h),
                    Text(
                      "مرحبا بك",
                      textDirection: TextDirection.rtl,
                      style: Styles.textStyle22,
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "ما تريد ان تتعلم اليوم؟",
              textDirection: TextDirection.rtl,
              style: Styles.textStyle14.copyWith(color: Colors.grey),
            ),
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              padding: EdgeInsets.only(right: 20.w, left: 6.w),
              width: double.infinity,
              height: 80.h,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100.r),
                  topLeft: Radius.circular(100.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child:
                          Image.asset("assets/images/icon.png", width: 70.w)),
                  Text(
                    "أبدا الان رحلتك\nالتعلمية مع EDUCA",
                    textDirection: TextDirection.rtl,
                    style: Styles.textStyle18.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              "الكورسات الاخيرة",
              textDirection: TextDirection.rtl,
              style: Styles.textStyle16,
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SizedBox(
              height: 235.h,
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
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              "كورسات موصي بها",
              textDirection: TextDirection.rtl,
              style: Styles.textStyle16,
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SizedBox(
              height: 235.h,
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
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
