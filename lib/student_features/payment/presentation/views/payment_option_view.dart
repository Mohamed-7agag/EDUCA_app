import 'package:flutter/material.dart';

import '../widgets/payment_option_view_body.dart';

class PaymentOptionView extends StatelessWidget {
  const PaymentOptionView({super.key, required this.subjectID});
  final int subjectID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: PaymentOptionViewBody(subjectID: subjectID)),
    );
  }
}
