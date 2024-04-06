import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/constatnt.dart';
import '../../../../Core/utils/styles.dart';

class CustomClassOptionsShape extends StatelessWidget {
  const CustomClassOptionsShape({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(200.r),
            bottomRight: Radius.circular(200.r),
          )),
      child: Text(
        text,
        style: Styles.textStyle30.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
