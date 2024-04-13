import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/student_features/class_options/presentation/widgets/custom_class_options_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateClassViewBody extends StatelessWidget {
  const CreateClassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomClassOptionsShape(text: "أنشاء مادة جديدة"),
        SizedBox(height: 35.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                      child: CustomDetailsForCreateClass(
                          name: "الصف الدراسي", hint: "الأول الأبتدائي")),
                  SizedBox(width: 15.w),
                  const Expanded(
                      child: CustomDetailsForCreateClass(
                          name: "أسم المادة", hint: "الرياضيات")),
                ],
              ),
              SizedBox(height: 35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                      child: CustomDetailsForCreateClass(
                          name: "سعر الحصة", hint: "25 جنية")),
                  SizedBox(width: 15.w),
                  const Expanded(
                      child: CustomDetailsForCreateClass(
                          name: "الترم", hint: "الأول")),
                ],
              ),
              SizedBox(height: 35.h),
              const CustomDetailsForCreateClass(
                  name: "وصف المادة", hint: "برمجة البرمجيات"),
              SizedBox(height: 60.h),
              CustomButton(text: "أنشاء", onpressed: () {}),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomDetailsForCreateClass extends StatelessWidget {
  const CustomDetailsForCreateClass({
    super.key,
    required this.name,
    required this.hint,
  });

  final String name;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          name,
          textDirection: TextDirection.rtl,
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 7.h),
        Container(
          height: 55.h,
          decoration: BoxDecoration(
              color: kSplashColor, borderRadius: BorderRadius.circular(4.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                iconSize: 30,
                icon: const Icon(
                  Icons.expand_more,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(width: 5.w),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Text(
                  hint,
                  textDirection: TextDirection.rtl,
                  style: Styles.textStyle14.copyWith(color: kPrimaryColor),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
