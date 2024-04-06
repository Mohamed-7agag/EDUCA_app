import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onpressed});
  final String text;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r))),
      child: Text(
        text,
        style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
