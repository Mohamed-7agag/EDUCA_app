import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/views/make_quiz_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utils/routes.dart';

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
                  Container(
                    width: 65.w,
                    padding: const EdgeInsets.only(
                        left: 6, right: 10, top: 6, bottom: 6),
                    decoration: const BoxDecoration(
                        color: kSplashDarkerColor,
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const MakeQuizView(),
                              ),
                            );
                          },
                          splashColor: kSplashColor,
                          borderRadius: BorderRadius.circular(6),
                          child: const Icon(
                            Icons.add,
                            color: kPrimaryColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("6", style: Styles.textStyle16),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "عدد الاختبارات لهذه المادة :  ",
                    style: Styles.textStyle12.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, Routes.enrolledStudentsViewRoute);
                    },
                    child: Text(
                      "عرض",
                      style: Styles.textStyle14.copyWith(color: kPrimaryColor),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "22",
                        style: Styles.textStyle16,
                      ),
                      Text(
                        "عدد الطلاب المسجلين المادة :   ",
                        style: Styles.textStyle12.copyWith(color: Colors.grey),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
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
