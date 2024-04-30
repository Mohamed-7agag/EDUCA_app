import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/enrolled_students_view.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/enrolled_students_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailsTeacherViewBody extends StatelessWidget {
  const CourseDetailsTeacherViewBody({super.key});

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
                height: 60.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r),
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
                maxLines: 3,
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
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "اضافة",
                          style:
                              Styles.textStyle16.copyWith(color: kPrimaryColor),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "3",
                        style: Styles.textStyle16,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  Text(
                    "عدد الاختبارات لهذه المادة :  ",
                    style: Styles.textStyle12.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const EnrolledStudentsView(),
                            ),
                          );
                        },
                        child: Text(
                          "عرض",
                          style:
                              Styles.textStyle16.copyWith(color: kPrimaryColor),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "22",
                        style: Styles.textStyle16,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  Text(
                    "عدد الطلاب المسجلين المادة :  ",
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
          child: CustomButton(text: "تعديل المادة", onpressed: () {}),
        )
      ],
    );
  }
}
