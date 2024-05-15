import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../auth/presentation/view_model/register_option_cubit.dart';
import '../../../auth/presentation/widgets/custom_radio_list_tile.dart';
import 'search_list_view.dart';
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
          BlocBuilder<OptionCubit, String>(
            builder: (context, searchTypeState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("بحث عن"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomRadioListTile(
                          optionState: searchTypeState,
                          value: "مادة دراسية",
                        ),
                      ),
                      Expanded(
                        child: CustomRadioListTile(
                          optionState: searchTypeState,
                          value: "معلم",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SearchTextFormField(
                    searchType: searchTypeState,
                  ),
                ],
              );
            },
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
