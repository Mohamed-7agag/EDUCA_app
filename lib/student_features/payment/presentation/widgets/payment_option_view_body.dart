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
          SizedBox(height: 25.h),
          Text(
            "أختر طريقة الدفع",
            style: Styles.textStyle22,
          ),
          SizedBox(height: 40.h),
          PaymentOptionItem(
            image: "assets/images/visa.png",
            onTap: () {
              Navigator.pushNamed(context, Routes.visaViewRoute);
            },
          ),
          SizedBox(height: 25.h),
          PaymentOptionItem(
            image: "assets/images/refcode.png",
            onTap: () {
              Navigator.pushNamed(context, Routes.refCodeViewRoute);
            },
          ),
        ],
      ),
    ));
  }
}
