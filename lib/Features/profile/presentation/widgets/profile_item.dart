import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {super.key,
      required this.title,
      required this.value,
      required this.onpressed,
      required this.iconData});
  final String title;
  final String value;
  final VoidCallback onpressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onpressed,
          child: Text(
            "تعديل",
            style: Styles.textStyle14.copyWith(color: kPrimaryColor),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style:
                      Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.h),
                value.length < 30
                    ? Text(value, style: Styles.textStyle16)
                    : Text(value.substring(0, 30), style: Styles.textStyle16),
              ],
            ),
            SizedBox(width: 20.w),
            Icon(iconData, color: kPrimaryColor),
          ],
        ),
      ],
    );
  }
}
