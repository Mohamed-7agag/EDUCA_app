import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/styles.dart';

class CustomDetailsForCreateClass extends StatelessWidget {
  const CustomDetailsForCreateClass({
    super.key,
    required this.name,
    required this.hint,
  });

  final String name;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          name,
          textDirection: TextDirection.rtl,
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 7.h),
        Container(
          height: 55.h,
          decoration: BoxDecoration(
              color: kSplashColor, borderRadius: BorderRadius.circular(4.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                iconSize: 30,
                icon: const Icon(
                  Icons.expand_more,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(width: 5.w),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Text(
                  hint,
                  textDirection: TextDirection.rtl,
                  style: Styles.textStyle14.copyWith(color: kPrimaryColor),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
