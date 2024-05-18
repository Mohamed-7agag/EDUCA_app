import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/teacher_features/courses/data/models/course_model.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/cubit/get_all_courses_teacher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseListViewItem extends StatelessWidget {
  const CourseListViewItem({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.courseDetailsTeacherViewRoute,
            arguments: course);
      },
      splashColor: kSplashColor,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: 230.w,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(9, 0, 0, 0),
              blurRadius: 3.0,
            ),
          ],
          border: Border(
              left: BorderSide(color: Colors.grey.shade200, width: 0.6),
              right: BorderSide(color: Colors.grey.shade200, width: 0.6),
              bottom: BorderSide(color: Colors.grey.shade200, width: 0.8)),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 110.h,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                    child: Image.asset(
                      "assets/images/english.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  BlocConsumer<GetAllCoursesTeacherCubit,
                      GetAllCoursesTeacherState>(
                    listener: (context, state) {
                      if (state is GetAllCoursesDeleteSubjectSuccess) {
                        successCherryToast(
                          context,
                          "عملية ناجحة",
                          "تم حذف المادة الدراسية بنجاح",
                        );

                        Navigator.pushReplacementNamed(
                            context, Routes.customBottomBarForTeacherViewRoute);
                      } else if (state is GetAllCoursesDeleteSubjectFailure) {
                        errorCherryToast(
                          context,
                          "حدث خطأ",
                          state.message,
                        );
                      }
                    },
                    builder: (context, state) {
                      return Positioned(
                        top: 4.h,
                        left: 4.w,
                        child: IconButton(
                          onPressed: () {
                            state is GetAllCoursesDeleteSubjectLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.red,
                                    ),
                                  )
                                : AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.infoReverse,
                                    animType: AnimType.topSlide,
                                    title: 'تنبيه',
                                    desc: 'هل تريد حذف هذا المادة الدراسية ؟',
                                    btnCancelOnPress: () {},
                                    btnOkOnPress: () {
                                      context
                                          .read<GetAllCoursesTeacherCubit>()
                                          .deleteCourse(subjectId: 4);
                                      Navigator.pushReplacementNamed(
                                          context,
                                          Routes
                                              .customBottomBarForTeacherViewRoute);
                                    },
                                    btnOkText: 'نعم',
                                    btnCancelText: 'لا',
                                  ).show();
                          },
                          icon: Icon(
                            Icons.delete,
                            color: kPrimaryColor,
                            size: 21.sp,
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.all(
                                    Radius.circular(4.r)),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 10.w, right: 14.w, top: 12.h, bottom: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        course.subjectName!,
                        style: Styles.textStyle14,
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.import_contacts_rounded,
                        color: kPrimaryColor,
                        size: 18.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        course.addingTime!.substring(0, 10),
                        style: Styles.textStyle14,
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        course.level!,
                        style: Styles.textStyle14,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
