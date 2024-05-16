import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'search_list_view.dart';
import 'search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key, required this.searchType});
  final String searchType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 20.h),
          SearchTextFormField(
            searchType: searchType,
          ),
          SizedBox(height: 20.h),
          Text(
            "نتائج البحث",
            style: Styles.textStyle14,
          ),
          SizedBox(height: 20.h),
          const Expanded(
            child: SearchListView(),
          ),
        ],
      ),
    );
  }
}
