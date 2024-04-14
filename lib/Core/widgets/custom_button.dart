import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onpressed,
    this.textcolor,
    this.backroundcolor,
    this.fontWeight,
    this.rectangleBorder,
  });
  final String text;
  final VoidCallback onpressed;
  final Color? textcolor;
  final Color? backroundcolor;

  final FontWeight? fontWeight;

  final RoundedRectangleBorder? rectangleBorder;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        backgroundColor: backroundcolor ?? kPrimaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.only(bottom: 15, top: 17),
        shape: rectangleBorder ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
      ),
      child: Text(
        text,
        style: Styles.textStyle20.copyWith(
          fontWeight: fontWeight ?? FontWeight.bold,
          color: textcolor,
        ),
      ),
    );
  }
}
