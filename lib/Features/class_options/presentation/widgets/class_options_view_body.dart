// ignore_for_file: must_be_immutable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:field_training_app/Features/class_options/data/class_option_data.dart';
import 'package:field_training_app/Features/class_options/presentation/view_model/class_options_cubit.dart';
import 'package:field_training_app/Features/class_options/presentation/widgets/custom_class_options_item.dart';
import 'package:field_training_app/Features/class_options/presentation/widgets/custom_class_options_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/routes.dart';
import '../../../../Core/widgets/custom_button.dart';

class ClassOptionsViewBody extends StatelessWidget {
   ClassOptionsViewBody({super.key});
int selectedIdx = -1;
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        const CustomClassOptionsShape(text: "أختر المرحلة الدراسية"),
        SizedBox(height: 45.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 420.h,
                child: ListView.builder(
                  itemCount: classOptionsData.keys.toList().length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: CustomClassOptionsItem(
                        list: classOptionsData.keys.toList(),
                        index: index,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              BlocListener<ClassOptionsCubit, int>(
                listener: (context, state) {
                  selectedIdx = state;
                },
                child: CustomButton(
                    text: "التالي",
                    onpressed: () {
                      if (selectedIdx != -1) {
                        Navigator.pushNamed(
                            context, Routes.selectedClassOptionsViewRoute,
                            arguments: selectedIdx);
                      } else {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'حدث خطأ',
                          desc: 'أختر المرحلة الدراسية',
                          btnOkText: "حسنا",
                          btnCancelText: "اغلاق",
                          btnOkOnPress: () {},
                          btnCancelOnPress: () {},
                        ).show();
                      }
                    }),
              )
            ],
          ),
        ),
      ],
    );
  }
}
