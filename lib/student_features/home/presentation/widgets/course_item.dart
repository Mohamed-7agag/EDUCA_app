import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/student_features/my_courses/presentation/view_model/favourite_courses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.courseDetailsViewRoute);
      },
      splashColor: kSplashColor,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: 230.w,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(8, 0, 0, 0),
              blurRadius: 3.0,
            ),
          ],
          border: Border(
              left: BorderSide(color: Colors.grey.shade200, width: 0.6),
              right: BorderSide(color: Colors.grey.shade200, width: 0.6),
              bottom: BorderSide(color: Colors.grey.shade200, width: 0.8)),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r),
                  ),
                  child: Image.asset("assets/images/math.png"),
                ),
                Positioned(
                  top: 6.h,
                  left: 6.w,
                  child: BlocBuilder<FavouriteCoursesCubit, bool>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          // todo add this course object to favourite
                          BlocProvider.of<FavouriteCoursesCubit>(context)
                              .changeState();
                        },
                        borderRadius: BorderRadius.circular(5.r),
                        splashColor: kSplashColor,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.all(
                              Radius.circular(5.r),
                            ),
                          ),
                          child: Icon(
                            state == false
                                ? Icons.favorite_border
                                : Icons.favorite,
                            color: kPrimaryColor,
                            size: 20.sp,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 10.w, right: 12.w, top: 10.h, bottom: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("حسين علي",
                          style: Styles.textStyle14.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 12.sp)),
                      SizedBox(width: 6.w),
                      CircleAvatar(
                          radius: 11.r, backgroundColor: kPrimaryColor),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "مادة الرياضيات",
                    style: Styles.textStyle14,
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "للصف الاول الاعدادي / ترم أول",
                    style: Styles.textStyle14,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "25 جنيه",
                        style:
                            Styles.textStyle14.copyWith(color: kPrimaryColor),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "سعر الحصة : ",
                        style: Styles.textStyle14,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
