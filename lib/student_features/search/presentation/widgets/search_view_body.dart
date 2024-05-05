import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/widgets/custom_search_loading_widget.dart';
import 'search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 20.h),
          const SearchTextFormField(),
          SizedBox(height: 20.h),
          Text(
            "نتائج البحث",
            style: Styles.textStyle14,
          ),
          SizedBox(height: 20.h),
          const Expanded(child: CustomSearchLoadingWidget()),
          // const Expanded(
          //   child: SearchListView(),
          // ),
        ],
      ),
    );
  }
}
