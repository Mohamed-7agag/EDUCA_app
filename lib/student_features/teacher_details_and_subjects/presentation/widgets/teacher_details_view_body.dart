import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cached_image.dart';
import 'package:field_training_app/Core/widgets/custom_failure_widget.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:field_training_app/student_features/teacher_details_and_subjects/presentation/view_model/cubit/teacher_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'teacher_details_item.dart';

class TeacherDetailsViewBody extends StatelessWidget {
  const TeacherDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<TeacherDetailsCubit, TeacherDetailsState>(
        builder: (context, state) {
          if (state is TeacherDetailsSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 15.h),
                const Row(
                  children: [
                    CustomPopIconButton(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCachedImage(
                      imageUrl: state.teacherModel.profileImageUrl ?? '',
                      width: 115,
                      height: 115,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  'أ / ${state.teacherModel.firstName!} ${state.teacherModel.lastName!}',
                  textAlign: TextAlign.center,
                  style:
                      Styles.textStyle22.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                Text(
                  state.teacherModel.email!,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle16,
                ),
                SizedBox(height: 40.h),
                TeacherDetailsItem(
                  title: state.teacherModel.governorate!,
                  icon: Icons.location_on_outlined,
                ),
                SizedBox(height: 28.h),
                TeacherDetailsItem(
                  title: state.teacherModel.address!,
                  icon: Icons.location_city_rounded,
                ),
                SizedBox(height: 28.h),
                TeacherDetailsItem(
                  title: state.teacherModel.phone!
                      .substring(2, state.teacherModel.phone!.length),
                  icon: Icons.phone_android_rounded,
                ),
                Expanded(child: SizedBox(height: 30.h)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, Routes.teacherSubjectsViewRoute,
                        arguments: state.teacherModel.id);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    foregroundColor: kPrimaryColor,
                    padding: const EdgeInsets.only(bottom: 15, top: 17),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r)),
                    side: const BorderSide(color: kPrimaryColor, width: 1.3),
                  ),
                  child: Text(
                    'المواد التي تم أنشائها',
                    style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                CustomButton(
                  text: 'الرجوع للصفحة الرئيسية',
                  textStyle: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  onpressed: () {
                    Navigator.pushNamedAndRemoveUntil(context,
                        Routes.customBottomBarViewRoute, (route) => false);
                  },
                ),
                SizedBox(height: 20.h),
              ],
            );
          } else if (state is TeacherDetailsFailure) {
            return const CustomFailureWidget(
                errMessage: 'حدث خطأ أثناء تحميل بيانات المعلم');
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }
}
