import 'package:field_training_app/Core/models/subject_model.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/utils/subject_image.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:field_training_app/student_features/payment/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailsViewBody extends StatelessWidget {
  const CourseDetailsViewBody({super.key, required this.subjectModel});
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
                      topLeft: Radius.circular(35.r),
                      topRight: Radius.circular(35.r),
                    )),
              ),
            ),
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
                      size: 26,
                      color: kPrimaryColor,
                    ),
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.all(10.r),
                      backgroundColor: kSplashColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "حسين القزاز",
                        style: Styles.textStyle16
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 7.w),
                      const CircleAvatar(backgroundColor: kSplashColor),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),
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
                        "الفصل الثاني",
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
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {
              if (state is PaymentRequestTokenSuccessState) {
                Navigator.pushNamed(context, Routes.paymentOptionViewRoute);
              }
              if (state is PaymentRequestTokenErrorState) {
                errorCherryToast(context, "حدث خطا", state.error);
              }
            },
            builder: (context, state) {
              return state is PaymentOrderIdLoadingState
                  ? const CustomLoadingWidget()
                  : CustomButton(
                      text: "تسجيل المادة",
                      onpressed: () {
                        context.read<PaymentCubit>().getOrderRegistrationID(
                              price: "8000",
                              firstName:
                                  CacheHelper.getData(key: studentFirstName),
                              lastName:
                                  CacheHelper.getData(key: studentLastName),
                              email: CacheHelper.getData(key: studentEmail),
                              phone: CacheHelper.getData(key: studentPhone),
                            );
                      });
            },
          ),
        )
      ],
    );
  }
}
