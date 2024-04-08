// ignore_for_file: must_be_immutable
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Features/auth/presentation/view_model/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileEditView extends StatelessWidget {
  ProfileEditView({super.key, required this.value, required this.parameter});

  String value;
  final String parameter;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40.h),
              TextFormField(
                //controller: controller,
                onChanged: (val) {
                  value = val;
                },
                cursorColor: kPrimaryColor,
                cursorErrorColor: Colors.red,
                initialValue: value,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: kPrimaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                    text: "تعديل",
                    onpressed: () {
                      //!TODO : check appRegex is valid
                      if(value.isEmpty){
                         AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'حدث خطأ',
                          desc: 'الحقل فارغ',
                          btnOkText: "حسنا",
                          btnCancelText: "اغلاق",
                          btnOkOnPress: () {},
                          btnCancelOnPress: () {},
                        ).show();
                      }
                      else{
                        context
                          .read<StudentCubit>()
                          .updateData(parameter, value);
                      Navigator.pop(context);
                      }
                      
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
