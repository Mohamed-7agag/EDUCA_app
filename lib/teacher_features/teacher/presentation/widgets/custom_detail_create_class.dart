import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/teacher_features/teacher/presentation/views_model/cubit/drop_down_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/styles.dart';

class CustomDetailsForCreateClass extends StatefulWidget {
  const CustomDetailsForCreateClass({
    super.key,
    required this.name,
    required this.hint,
    required this.Indx,
    required this.popupMenuButton, required this.selectedItem,
  });

  final String name;
  final String hint;
  final int Indx;
  final String selectedItem;
  final PopupMenuButton popupMenuButton;

  @override
  State<CustomDetailsForCreateClass> createState() =>
      _CustomDetailsForCreateClassState();
}

class _CustomDetailsForCreateClassState
    extends State<CustomDetailsForCreateClass> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropDownListCubit, String>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              widget.name,
              textDirection: TextDirection.rtl,
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7.h),
            Container(
              height: 55.h,
              decoration: BoxDecoration(
                  color: kSplashColor,
                  borderRadius: BorderRadius.circular(4.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.popupMenuButton,
                  //
                  SizedBox(width: 5.w),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      widget.selectedItem,
                      textDirection: TextDirection.rtl,
                      style: Styles.textStyle14.copyWith(color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
