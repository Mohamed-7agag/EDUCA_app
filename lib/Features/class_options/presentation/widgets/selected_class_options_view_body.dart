import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:field_training_app/Features/class_options/data/class_option_data.dart';
import 'package:field_training_app/Features/class_options/presentation/widgets/custom_class_options_item.dart';
import 'package:field_training_app/Features/class_options/presentation/widgets/custom_class_options_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/widgets/custom_button.dart';

class SelectedClassOptionsViewBody extends StatelessWidget {
  const SelectedClassOptionsViewBody({super.key, required this.idx});
  final int idx;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomClassOptionsShape(text: "أختر الصف الدراسي"),
        SizedBox(height: 38.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 510.h,
                child: ListView.builder(
                  itemCount: classOptionsData[classOptionsNames[idx]].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: CustomClassOptionsItem(
                            list: classOptionsData[classOptionsNames[idx]]
                                .toList(),
                            index: index));
                  },
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                  text: "بدا التعلم",
                  onpressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'حدث خطأ',
                      desc: 'أختر الصف الدراسي',
                      btnOkText: "حسنا",
                      btnCancelText: "اغلاق",
                      btnOkOnPress: () {},
                      btnCancelOnPress: () {},
                    ).show();
                  })
            ],
          ),
        ),
      ],
    );
  }
}
