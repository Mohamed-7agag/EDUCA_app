import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/app_router.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({super.key});

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
                cursorColor: kPrimaryColor,
                cursorErrorColor: Colors.red,
                initialValue: "Christina Angela",
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
                      //! do something here
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
