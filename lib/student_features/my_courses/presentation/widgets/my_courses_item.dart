import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCoursesItem extends StatelessWidget {
  const MyCoursesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
              height: 120.h,
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
                  Positioned(
                    top: 5.h,
                    left: 5.w,
                    child: IconButton(
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.infoReverse,
                          animType: AnimType.topSlide,
                          title: 'تنبيه',
                          desc: 'هل تريد حذف هذا المادة الدراسية ؟',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
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
                                Radius.circular(5.r)),
                          ),
                        ),
                      ),
                    ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("حسين علي",
                          style: Styles.textStyle14.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 12.sp)),
                      SizedBox(width: 6.w),
                      CircleAvatar(
                          radius: 12.r, backgroundColor: kPrimaryColor),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "مادة الرياضيات",
                    style: Styles.textStyle14,
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "للصف الاول الاعدادي / ترم أول",
                    style: Styles.textStyle14,
                    textAlign: TextAlign.right,
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
