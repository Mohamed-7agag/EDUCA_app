import 'package:flutter/material.dart';

import '../utils/constatnt.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: kPrimaryColor,
      strokeCap: StrokeCap.round,
    ));
  }
}
