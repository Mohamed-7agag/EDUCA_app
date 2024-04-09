// ignore_for_file: must_be_immutable
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Features/auth/presentation/view_model/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../class_options/data/class_option_data.dart';

class ProfileSelectClassEditView extends StatefulWidget {
  ProfileSelectClassEditView({super.key, required this.value});

  String value;

  @override
  State<ProfileSelectClassEditView> createState() =>
      _ProfileSelectClassEditViewState();
}

class _ProfileSelectClassEditViewState
    extends State<ProfileSelectClassEditView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "تعديل الصف الدراسي",
                style: Styles.textStyle24.copyWith(
                    fontWeight: FontWeight.bold, color: kPrimaryColor),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 60.h),
              DropdownButton(
                borderRadius: BorderRadius.circular(6),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                underline: Container(height: 1.5, color: kPrimaryColor),
                icon: const Icon(Icons.arrow_drop_down,
                    color: kPrimaryColor, size: 30),
                alignment: Alignment.centerRight,
                style: Styles.textStyle18.copyWith(color: Colors.black),
                elevation: 1,
                hint: Text(
                  widget.value,
                  style: Styles.textStyle16,
                ),
                onChanged: (val) {
                  setState(() {
                    widget.value = val.toString();
                  });
                },
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                    alignment: Alignment.centerRight,
                    value: classOptionsData["المرحلة الأبتدائية"].elementAt(0),
                    child: Text(
                        classOptionsData["المرحلة الأبتدائية"].elementAt(0)),
                  ),
                  DropdownMenuItem(
                    alignment: Alignment.centerRight,
                    value: classOptionsData["المرحلة الأبتدائية"].elementAt(1),
                    child: Text(
                        classOptionsData["المرحلة الأبتدائية"].elementAt(1)),
                  ),
                  DropdownMenuItem(
                    alignment: Alignment.centerRight,
                    value: classOptionsData["المرحلة الأبتدائية"].elementAt(2),
                    child: Text(
                        classOptionsData["المرحلة الأبتدائية"].elementAt(2)),
                  ),
                  DropdownMenuItem(
                    alignment: Alignment.centerRight,
                    value: classOptionsData["المرحلة الأبتدائية"].elementAt(3),
                    child: Text(
                        classOptionsData["المرحلة الأبتدائية"].elementAt(3)),
                  ),
                  DropdownMenuItem(
                    alignment: Alignment.centerRight,
                    value: classOptionsData["المرحلة الأبتدائية"].elementAt(4),
                    child: Text(
                        classOptionsData["المرحلة الأبتدائية"].elementAt(4)),
                  ),
                  DropdownMenuItem(
                    alignment: Alignment.centerRight,
                    value: classOptionsData["المرحلة الأبتدائية"].elementAt(5),
                    child: Text(
                        classOptionsData["المرحلة الأبتدائية"].elementAt(5)),
                  ),
                  DropdownMenuItem(
                    alignment: Alignment.centerRight,
                    value: classOptionsData["المرحلة الأعدادية"].elementAt(0),
                    child: Text(
                        classOptionsData["المرحلة الأعدادية"].elementAt(0)),
                  ),
                  DropdownMenuItem(
                    alignment: Alignment.centerRight,
                    value: classOptionsData["المرحلة الأعدادية"].elementAt(1),
                    child: Text(
                        classOptionsData["المرحلة الأعدادية"].elementAt(1)),
                  ),
                  DropdownMenuItem(
                    alignment: Alignment.centerRight,
                    value: classOptionsData["المرحلة الأعدادية"].elementAt(2),
                    child: Text(
                        classOptionsData["المرحلة الأعدادية"].elementAt(2)),
                  ),
                  DropdownMenuItem(
                    alignment: Alignment.centerRight,
                    value: classOptionsData["المرحلة الثانوية"].elementAt(0),
                    child:
                        Text(classOptionsData["المرحلة الثانوية"].elementAt(0)),
                  ),
                  DropdownMenuItem(
                    alignment: Alignment.centerRight,
                    value: classOptionsData["المرحلة الثانوية"].elementAt(1),
                    child:
                        Text(classOptionsData["المرحلة الثانوية"].elementAt(1)),
                  ),
                  DropdownMenuItem(
                    alignment: Alignment.centerRight,
                    value: classOptionsData["المرحلة الثانوية"].elementAt(2),
                    child:
                        Text(classOptionsData["المرحلة الثانوية"].elementAt(2)),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                    text: "تعديل",
                    onpressed: () {
                      context
                          .read<StudentCubit>()
                          .updateData('studentClass', widget.value);
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
