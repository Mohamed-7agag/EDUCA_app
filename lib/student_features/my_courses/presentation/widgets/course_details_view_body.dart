import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailsViewBody extends StatelessWidget {
  const CourseDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            Container(
              height: 230.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/english.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: -25.h,
              child: Container(
                height: 70.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(50.r),
                    )),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                      size: 26,
                      color: kPrimaryColor,
                    ),
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.all(10.r),
                      backgroundColor: kSplashColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "حسين القزاز",
                        style: Styles.textStyle16
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 7.w),
                      const CircleAvatar(backgroundColor: kSplashColor),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Text(
                "المادة الدراسية : ",
                style: Styles.textStyle12.copyWith(color: Colors.grey),
                textDirection: TextDirection.rtl,
              ),
              SizedBox(height: 7.h),
              Text(
                "جبر واحصاء",
                style: Styles.textStyle16,
              ),
              SizedBox(height: 22.h),
              Wrap(
                spacing: 70.w,
                alignment: WrapAlignment.end,
                verticalDirection: VerticalDirection.up,
                runSpacing: 20.h,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "الفصل الدراسي  : ",
                        style: Styles.textStyle12.copyWith(color: Colors.grey),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        "الفصل الثاني",
                        style: Styles.textStyle16,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "الصف الدراسي  : ",
                        style: Styles.textStyle12.copyWith(color: Colors.grey),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        "الصف الثالث الثانوي",
                        style: Styles.textStyle16,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 22.h),
              Text(
                "وصف المادة : ",
                style: Styles.textStyle12.copyWith(color: Colors.grey),
                textDirection: TextDirection.rtl,
              ),
              SizedBox(height: 7.h),
              Text(
                "هي مادة للصف الثالث الثانوي و تحتوي علي 6 فصول و كل فصل يحتوي علي 3 دروس",
                style: Styles.textStyle14,
                textDirection: TextDirection.rtl,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "25 جنية",
                    style: Styles.textStyle16.copyWith(color: kPrimaryColor),
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    "سعر الحصة : ",
                    style: Styles.textStyle12.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(child: SizedBox(height: 10.h)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: CustomButton(text: "تسجيل المادة", onpressed: () {}),
        )
      ],
    );
  }
}
