import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/course_lisview_item.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/get_all_courses_cubit/get_all_courses_teacher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTeacherViewBody extends StatelessWidget {
  const HomeTeacherViewBody({super.key});

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
                      child: Image.asset("assets/images/welcome2.png",
                          width: 31.w),
                    ),
                    SizedBox(width: 10.h),
                    Text(
                      "مرحبا بك",
                      textDirection: TextDirection.rtl,
                      style: Styles.textStyle22,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "ما تريد ان تعلم اليوم؟",
              textDirection: TextDirection.rtl,
              style: Styles.textStyle14.copyWith(color: Colors.grey),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              "الكورسات الاخيرة",
              textDirection: TextDirection.rtl,
              style: Styles.textStyle16,
            ),
          ),
          SizedBox(height: 15.h),
          BlocBuilder<GetAllCoursesTeacherCubit, GetAllCoursesTeacherState>(
            builder: (context, state) {
              if (state is GetAllCoursesTeacherSuccess) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SizedBox(
                    height: 230.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      itemCount: state.courses.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child:
                              CourseListViewItem(course: state.courses[index]),
                        );
                      },
                    ),
                  ),
                );
              } else if (state is GetAllCoursesTeacherFailure) {
                return Text(state.message);
              } else {
                return const CustomLoadingWidget();
              }
            },
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
    );
  }
}
