import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/student_features/class_options/data/class_option_data.dart';
import 'package:field_training_app/student_features/class_options/presentation/widgets/custom_class_options_shape.dart';
import 'package:field_training_app/teacher_features/teacher/data/course_data.dart';
import 'package:field_training_app/teacher_features/teacher/presentation/views_model/cubit/drop_down_list_cubit.dart';
import 'package:field_training_app/teacher_features/teacher/presentation/widgets/custom_detail_create_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/routes.dart';

class CreateClassViewBody extends StatelessWidget {
  const CreateClassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomClassOptionsShape(text: "أنشاء مادة جديدة"),
          SizedBox(height: 35.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: BlocBuilder<DropDownListCubit, String>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomDetailsForCreateClass(
                      indx: 0,
                      name: "الصف الدراسي",
                      hint: "الأول الأبتدائي",
                      selectedItem:
                          BlocProvider.of<DropDownListCubit>(context).lev,
                      onSelected: (value) {
                        BlocProvider.of<DropDownListCubit>(context)
                            .changeIndexDropDownListLevel(value);
                      },
                      listItemBuilder: classOptionsValues,
                    ),
                    SizedBox(height: 15.h),
                    CustomDetailsForCreateClass(
                      indx: 1,
                      name: "أسم المادة",
                      hint: "الرياضيات",
                      selectedItem:
                          BlocProvider.of<DropDownListCubit>(context).sub,
                      onSelected: (value) {
                        BlocProvider.of<DropDownListCubit>(context)
                            .changeIndexDropDownListsubject(value);
                      },
                      listItemBuilder: courses,
                    ),
                    SizedBox(height: 35.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomDetailsForCreateClass(
                            indx: 2,
                            name: "سعر الحصة",
                            hint: "25 جنية",
                            selectedItem:
                                BlocProvider.of<DropDownListCubit>(context)
                                    .price,
                            onSelected: (value) {
                              BlocProvider.of<DropDownListCubit>(context)
                                  .changeIndexDropDownListprice(value);
                            },
                            listItemBuilder: coursePrice,
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Expanded(
                          child: CustomDetailsForCreateClass(
                            indx: 1,
                            name: "الترم",
                            hint: "الاول",
                            selectedItem:
                                BlocProvider.of<DropDownListCubit>(context)
                                    .term,
                            onSelected: (value) {
                              BlocProvider.of<DropDownListCubit>(context)
                                  .changeIndexDropDownListterm(value);
                            },
                            listItemBuilder: const ['ألاول', 'الثاني'],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35.h),
                    Text(
                      "وصف المادة",
                      textDirection: TextDirection.rtl,
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    TextField(
                      controller: context
                          .read<DropDownListCubit>()
                          .descriptionController,
                      cursorColor: kPrimaryColor,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "اكتب وصف للمادة",
                        hintStyle:
                            Styles.textStyle14.copyWith(color: kPrimaryColor),
                        filled: true,
                        fillColor: kSplashColor,
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kSplashColor),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      ),
                    ),
                    SizedBox(height: 120.h),
                    CustomButton(
                      text: "أنشاء",
                      onpressed: () {
                        Navigator.pushNamed(
                            context, Routes.customBottomBarForTeacherViewRoute);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
