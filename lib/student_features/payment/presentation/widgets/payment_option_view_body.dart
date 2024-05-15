import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'payment_option_item.dart';

class PaymentOptionViewBody extends StatelessWidget {
  const PaymentOptionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Text(
            "أختر طريقة الدفع",
            style: Styles.textStyle22,
          ),
          SizedBox(height: 30.h),
          PaymentOptionItem(
            text: "فيزا (الشكل البسيط)",
            image: "assets/images/visa.png",
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                Routes.visaViewRoute,
                arguments: PaymentConstants.visaUrl,
              );
            },
          ),
          SizedBox(height: 22.h),
          PaymentOptionItem(
            text: "فيزا (الشكل المتقدم)",
            image: "assets/images/credit-card.png",
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                Routes.visaViewRoute,
                arguments: PaymentConstants.visaUrl2,
              );
            },
          ),
          SizedBox(height: 22.h),
          PaymentOptionItem(
            text: "الرمز المرجعي",
            image: "assets/images/refcode.png",
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.refCodeViewRoute);
            },
          ),
        ],
      ),
    ));
  }
}
