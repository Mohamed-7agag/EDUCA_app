import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/teacher_features/courses/data/models/course_model.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/classes_and_subclasses_listview.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utils/routes.dart';

class CourseDetailsTeacherViewBody extends StatelessWidget {
  const CourseDetailsTeacherViewBody({super.key, required this.courseModel});

  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 230.h,
                pinned: true,
                title: Center(
                  child: Text(
                    '${courseModel.subjectName} - ${courseModel.level}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/english.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
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
                        courseModel.subjectName!,
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
                                style: Styles.textStyle12
                                    .copyWith(color: Colors.grey),
                                textDirection: TextDirection.rtl,
                              ),
                              SizedBox(height: 7.h),
                              Text(
                                courseModel.term == 1
                                    ? "الفصل الاول"
                                    : "الفصل الثاني",
                                style: Styles.textStyle16,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "الصف الدراسي  : ",
                                style: Styles.textStyle12
                                    .copyWith(color: Colors.grey),
                                textDirection: TextDirection.rtl,
                              ),
                              SizedBox(height: 7.h),
                              Text(
                                courseModel.level!,
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
                        courseModel.describtion!,
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
                            "${courseModel.pricePerHour} جنية",
                            style: Styles.textStyle16
                                .copyWith(color: kPrimaryColor),
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            "سعر الحصة : ",
                            style:
                                Styles.textStyle12.copyWith(color: Colors.grey),
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
                                borderRadius: BorderRadiusDirectional.all(
                                    Radius.circular(5))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        Routes.showAllQuizzesViewRoute,
                                        arguments: courseModel.subjectId);
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
                            style:
                                Styles.textStyle12.copyWith(color: Colors.grey),
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
                                  context, Routes.enrolledStudentsViewRoute,
                                  arguments: courseModel.subjectId);
                            },
                            child: Text(
                              "عرض",
                              style: Styles.textStyle14
                                  .copyWith(color: kPrimaryColor),
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
                                style: Styles.textStyle12
                                    .copyWith(color: Colors.grey),
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        "الدروس",
                        style: Styles.textStyle18
                            .copyWith(fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
              const ClassesAndSubClassesListViews(),
              SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: CustomButton(text: "تعديل المادة", onpressed: () {}),
        )
      ],
    );
  }
}




