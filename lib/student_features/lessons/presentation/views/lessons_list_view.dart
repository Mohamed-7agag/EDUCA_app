import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/widgets/custom_failure_widget.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:field_training_app/student_features/lessons/presentation/view_model/cubit/lessons_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/styles.dart';

class LessonsListView extends StatelessWidget {
  const LessonsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title:
            CustomPopIconButton(backgroundColor: Colors.white70, radius: 18.r),
        actions: [
          Text("الدروس",
              style: Styles.textStyle18.copyWith(color: Colors.white)),
          SizedBox(width: 14.w),
        ],
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<LessonsCubit, LessonsState>(
          builder: (context, state) {
            if (state is LessonsSuccess) {
              return state.lessons.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.lessons.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(6.r),
                            splashColor: kSplashColor,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(color: Colors.grey[400]!),
                              ),
                              child: Text(
                                state.lessons[index].name!,
                                style: Styles.textStyle18,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(child: Text('لا يوجد دروس'));
            } else if (state is LessonsFailure) {
              return CustomFailureWidget(errMessage: state.errMessage);
            }
            return const CustomLoadingWidget();
          },
        ),
      ),
    );
  }
}
