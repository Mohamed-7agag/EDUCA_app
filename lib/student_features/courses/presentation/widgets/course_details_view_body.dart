import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/models/subject_model.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/utils/subject_image.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cached_image.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:field_training_app/student_features/enrollment/presentation/view_model/cubit/enrollment_cubit.dart';
import 'package:field_training_app/student_features/payment/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailsViewBody extends StatelessWidget {
  const CourseDetailsViewBody({
    super.key,
    required this.subjectModel,
  });
  final SubjectModel subjectModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            Container(
              height: 230.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(subjectImage(subjectModel.subjName!)),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: -25.h,
              child: Container(
                height: 55.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    )),
              ),
            ),
            const Positioned(
                top: 15,
                left: 15,
                child: CustomPopIconButton(backgroundColor: Colors.white70))
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                      size: 25,
                      color: kPrimaryColor,
                    ),
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.all(10.r),
                      backgroundColor: kSplashColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.teacherDetailsViewRoute,
                        arguments: subjectModel.teacherId,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          subjectModel.teacherName!,
                          style: Styles.textStyle16
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10.w),
                        CustomCachedImage(
                          imageUrl: subjectModel.profileImageUrl ?? '',
                          width: 40,
                          height: 40,
                          errorIconSize: 23,
                          loadingWidth: 20.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              subjectModel.addingTime != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(subjectModel.addingTime!.substring(0, 10),
                            style: Styles.textStyle14),
                        SizedBox(width: 10.w),
                        Text(
                          ' : تاريخ الأنشاء',
                          style:
                              Styles.textStyle12.copyWith(color: Colors.grey),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              subjectModel.addingTime != null
                  ? SizedBox(height: 22.h)
                  : const SizedBox.shrink(),
              Text(
                "المادة الدراسية : ",
                style: Styles.textStyle12.copyWith(color: Colors.grey),
                textDirection: TextDirection.rtl,
              ),
              SizedBox(height: 7.h),
              Text(
                subjectModel.subjName!,
                style: Styles.textStyle16,
              ),
              SizedBox(height: 22.h),
              Wrap(
                spacing: 70.w,
                alignment: WrapAlignment.end,
                verticalDirection: VerticalDirection.up,
                runSpacing: 20.h,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "الفصل الدراسي  : ",
                        style: Styles.textStyle12.copyWith(color: Colors.grey),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        subjectModel.term == 1 ? 'الترم الأول' : 'الترم الثاني',
                        style: Styles.textStyle16,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "الصف الدراسي  : ",
                        style: Styles.textStyle12.copyWith(color: Colors.grey),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        subjectModel.level!,
                        style: Styles.textStyle16,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 22.h),
              Text(
                "وصف المادة : ",
                style: Styles.textStyle12.copyWith(color: Colors.grey),
                textDirection: TextDirection.rtl,
              ),
              SizedBox(height: 7.h),
              Text(
                subjectModel.describtion!,
                style: Styles.textStyle14,
                textDirection: TextDirection.rtl,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "3",
                    style: Styles.textStyle16.copyWith(color: kPrimaryColor),
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    "عدد الاختبارات لهذه المادة :  ",
                    style: Styles.textStyle12.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${subjectModel.pricePerHour} جنية",
                    style: Styles.textStyle16.copyWith(color: kPrimaryColor),
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    "سعر الحصة : ",
                    style: Styles.textStyle12.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(child: SizedBox(height: 10.h)),
        Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<EnrollmentCubit, EnrollmentState>(
            builder: (context, state) {
              if (state is AllStudentsEnrolledInSpecSubjectSuccess) {
                bool enrolled = state.studentsList.any((element) =>
                    element.studentId == CacheHelper.getData(key: ApiKey.id));
                return enrolled == false
                    ? BlocConsumer<PaymentCubit, PaymentState>(
                        listener: (context, paymentState) {
                          if (paymentState is PaymentOrderIdSuccessState) {
                            Navigator.pushNamed(
                                context, Routes.paymentOptionViewRoute);
                          } else if (paymentState is PaymentOrderIdErrorState) {
                            errorCherryToast(
                                context, "حدث خطا", "يرجي المحاولة مرة اخري");
                          }
                        },
                        builder: (context, paymentState) {
                          return paymentState is PaymentOrderIdLoadingState
                              ? const CustomLoadingWidget()
                              : CustomButton(
                                  text: "تسجيل المادة",
                                  onpressed: () {
                                    context
                                        .read<PaymentCubit>()
                                        .getOrderRegistrationID(
                                          price: subjectModel.pricePerHour!
                                              .toString(),
                                          firstName: CacheHelper.getData(
                                              key: studentFirstName),
                                          lastName: CacheHelper.getData(
                                              key: studentLastName),
                                          email: CacheHelper.getData(
                                              key: studentEmail),
                                          phone: CacheHelper.getData(
                                              key: studentPhone),
                                        );
                                  });
                        },
                      )
                    : CustomButton(
                        text: 'عرض الاختبارات',
                        onpressed: () {
                          Navigator.pushNamed(
                            context,
                            Routes.quizzesListViewRoute,
                            arguments: subjectModel.id!,
                          );
                        });
              } else if (state is AllStudentsEnrolledInSpecSubjectFailure) {
                return BlocConsumer<PaymentCubit, PaymentState>(
                  listener: (context, paymentState) {
                    if (paymentState is PaymentOrderIdSuccessState) {
                      Navigator.pushNamed(
                          context, Routes.paymentOptionViewRoute);
                    } else if (paymentState is PaymentOrderIdErrorState) {
                      errorCherryToast(
                          context, "حدث خطا", "يرجي المحاولة مرة اخري");
                    }
                  },
                  builder: (context, paymentState) {
                    return paymentState is PaymentOrderIdLoadingState
                        ? const CustomLoadingWidget()
                        : CustomButton(
                            text: "تسجيل المادة",
                            onpressed: () {
                              context
                                  .read<PaymentCubit>()
                                  .getOrderRegistrationID(
                                    price:
                                        subjectModel.pricePerHour!.toString(),
                                    firstName: CacheHelper.getData(
                                        key: studentFirstName),
                                    lastName: CacheHelper.getData(
                                        key: studentLastName),
                                    email:
                                        CacheHelper.getData(key: studentEmail),
                                    phone:
                                        CacheHelper.getData(key: studentPhone),
                                  );
                            });
                  },
                );
              }
              return const CustomLoadingWidget();
            },
          ),
        ),
      ],
    );
  }
}
