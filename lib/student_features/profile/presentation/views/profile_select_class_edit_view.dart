// ignore_for_file: must_be_immutable
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/student_features/profile/presentation/view_model/cubit/student_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/routes.dart';
import '../../../auth/presentation/widgets/class_option_values.dart';

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
      backgroundColor: Colors.white,
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
                items: classOptionsValues.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      alignment: Alignment.centerRight,
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BlocConsumer<StudentProfileCubit, StudentProfileState>(
                  listener: (context, state) {
                    if (state is StudentProfileUpdateSuccess) {
                      successCherryToast(
                          context, "عملية ناجحة", "تم تعديل بياناتك");

                      context.read<StudentProfileCubit>().getStudentData();
                      Navigator.pushNamed(
                          context, Routes.customBottomBarViewRoute);
                    } else if (state is StudentProfileUpdateFailure) {
                      errorCherryToast(context, "حدث خطأ", state.errMessage);
                    }
                  },
                  builder: (context, state) {
                    return state is StudentProfileUpdateLoading
                        ? const CustomLoadingWidget()
                        : CustomButton(
                            text: "تعديل",
                            onpressed: () {
                              context
                                  .read<StudentProfileCubit>()
                                  .updateStudentData(
                                      studentLevel: widget.value);
                            });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
