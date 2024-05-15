// ignore_for_file: must_be_immutable

import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/student_features/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFormField extends StatelessWidget {
  SearchTextFormField({super.key, required this.searchType});

  TextEditingController controller = TextEditingController();
  final String searchType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: kPrimaryColor,
      cursorHeight: 30.h,
      cursorRadius: Radius.circular(10.r),
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: "ابحث هنا",
        hintTextDirection: TextDirection.rtl,
        hintStyle: Styles.textStyle14.copyWith(color: kPrimaryColor),
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
        fillColor: kSplashColor,
        prefixIcon: IconButton(
            onPressed: () {
              //! must be changed
              if (controller.text.isNotEmpty || controller.text != "") {
                if (searchType == "teacher") {
                  context
                      .read<SearchCubit>()
                      .getSearchResults(controller.text, null);
                } else if (searchType == "subject") {
                  context
                      .read<SearchCubit>()
                      .getSearchResults(null, controller.text);
                } else {
                  context
                      .read<SearchCubit>()
                      .getSearchResults(null, controller.text);
                }
              } else {
                errorCherryToast(context, "حدث خطأ", "حقل البحث فارغ");
              }
            },
            icon: const Icon(
              Icons.search,
              color: kPrimaryColor,
              size: 26,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: Color.fromRGBO(9, 96, 245, 0.128))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: kPrimaryColor)),
      ),
    );
  }
}
