import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/student_features/class_options/presentation/widgets/custom_class_options_shape.dart';
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
    return Column(
      children: [
        const CustomClassOptionsShape(text: "أنشاء مادة جديدة"),
        SizedBox(height: 35.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlocBuilder<DropDownListCubit, String>(builder: (context, state) {
                return CustomDetailsForCreateClass(
                  Indx: 0,
                  name: "الصف الدراسي",
                  hint: "الأول الأبتدائي",
                  selectedItem: BlocProvider.of<DropDownListCubit>(context).lev,
                  popupMenuButton: PopupMenuButton(
                      icon: const Icon(
                        Icons.expand_more,
                        color: kPrimaryColor,
                        size: 32,
                      ),
                      onSelected: (value) {
                        BlocProvider.of<DropDownListCubit>(context)
                            .changeIndexDropDownListLevel(value);
                      },
                      itemBuilder: (BuildContext bc) {
                        return Level.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      }),
                );
              }),
              SizedBox(height: 15.h),
              BlocBuilder<DropDownListCubit, String>(
                builder: (context, state) {
                  return CustomDetailsForCreateClass(
                    Indx: 1,
                    name: "أسم المادة",
                    hint: "الرياضيات",
                    selectedItem:
                        BlocProvider.of<DropDownListCubit>(context).sub,
                    popupMenuButton: PopupMenuButton(
                        icon: const Icon(
                          Icons.expand_more,
                          color: kPrimaryColor,
                          size: 32,
                        ),
                        onSelected: (value) {
                          BlocProvider.of<DropDownListCubit>(context)
                              .changeIndexDropDownListsubject(value);
                        },
                        itemBuilder: (BuildContext bc) {
                          return subject.map((String item) {
                            return PopupMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList();
                        }),
                  );
                },
              ),
              SizedBox(height: 35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: BlocBuilder<DropDownListCubit, String>(
                      builder: (context, state) {
                        return CustomDetailsForCreateClass(
                          Indx: 2,
                          name: "سعر الحصة",
                          hint: "25 جنية",
                          selectedItem:
                              BlocProvider.of<DropDownListCubit>(context).price,
                          popupMenuButton: PopupMenuButton(
                              icon: const Icon(
                                Icons.expand_more,
                                color: kPrimaryColor,
                                size: 32,
                              ),
                              onSelected: (value) {
                                BlocProvider.of<DropDownListCubit>(context)
                                    .changeIndexDropDownListprice(value);
                              },
                              itemBuilder: (BuildContext bc) {
                                return ['30', '40', '50', '60', '70', '80']
                                    .map((String item) {
                                  return PopupMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList();
                              }),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: BlocBuilder<DropDownListCubit, String>(
                      builder: (context, state) {
                        return CustomDetailsForCreateClass(
                          Indx: 1,
                          name: "الترم",
                          hint: "الاول",
                          selectedItem:
                              BlocProvider.of<DropDownListCubit>(context).term,
                          popupMenuButton: PopupMenuButton(
                              icon: const Icon(
                                Icons.expand_more,
                                color: kPrimaryColor,
                                size: 32,
                              ),
                              onSelected: (value) {
                                BlocProvider.of<DropDownListCubit>(context)
                                    .changeIndexDropDownListterm(value);
                              },
                              itemBuilder: (BuildContext bc) {
                                return ['ألاول', 'الثاني'].map((String item) {
                                  return PopupMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList();
                              }),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35.h),
              // const CustomDetailsForCreateClass(
              //     Indx: 4, name: "وصف المادة", hint: "برمجة البرمجيات"),
              SizedBox(height: 60.h),
              CustomButton(
                  text: "أنشاء",
                  onpressed: () {
                    Navigator.pushNamed(
                        context, Routes.customBottomBarForTeacherViewRoute);
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
