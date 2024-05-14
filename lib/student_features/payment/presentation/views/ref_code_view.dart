import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/student_features/payment/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/widgets/custom_failure_widget.dart';

class RefCodeView extends StatelessWidget {
  const RefCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: BlocBuilder<PaymentCubit, PaymentState>(
              builder: (context, state) {
                if (state is PaymentRefCodeSuccessState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('يجب عليك الذهاب لاي متجر للدفع',
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(height: 10.h),
                      Text(
                        'الرمز المرجعي الخاص بك',
                        style: Styles.textStyle18,
                      ),
                      SizedBox(height: 30.0.h),
                      Container(
                        padding: const EdgeInsets.only(top: 16, bottom: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: kPrimaryColor,
                        ),
                        child: Center(
                          child: Text(
                            PaymentConstants.paymentRefCode.isEmpty
                                ? '🚫'
                                : PaymentConstants.paymentRefCode,
                            style: const TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                } else if (state is PaymentRefCodeErrorState) {
                  return const CustomFailureWidget(
                      errMessage: "حدثت مشكلة , حاول في وقت لاحق");
                }
                return const CustomLoadingWidget();
              },
            ),
          ),
        ),
      ),
    );
  }
}
