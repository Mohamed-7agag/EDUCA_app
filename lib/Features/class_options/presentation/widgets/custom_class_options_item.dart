import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/styles.dart';
import '../view_model/class_options_cubit.dart';

class CustomClassOptionsItem extends StatelessWidget {
  const CustomClassOptionsItem(
      {super.key, required this.index, required this.list});
  final int index;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassOptionsCubit, int>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<ClassOptionsCubit>().changeClassOption(index);
          },
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 72.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(
                color: state == index ? kPrimaryColor : Colors.grey,
                width: state == index ? 1.5.w : 1.w,
              ),
            ),
            child: Text(
              list[index],
              style: Styles.textStyle20.copyWith(color: state == index ? kPrimaryColor : Colors.black),
            ),
          ),
        );
      },
    );
  }
}
