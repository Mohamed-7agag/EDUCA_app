import 'package:flutter/material.dart';

import '../widgets/payment_option_view_body.dart';

class PaymentOptionView extends StatelessWidget {
  const PaymentOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: PaymentOptionViewBody()),
    );
  }
}
