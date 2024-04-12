import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: kSplashColor,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: 230.w,
        decoration: BoxDecoration(
          border: Border(
              left: BorderSide(color: Colors.grey.shade200),
              right: BorderSide(color: Colors.grey.shade200),
              bottom: BorderSide(color: Colors.grey.shade200)),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
              child: Image.asset("assets/images/math.png"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "مادة الرياضيات",
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "للصف الاول الاعدادي / ترم أول",
                    style: Styles.textStyle14,
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 5.h),
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
