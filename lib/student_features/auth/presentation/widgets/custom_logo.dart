import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        "assets/animation/login.json",
        frameRate: FrameRate.max,
      ),
    );
  }
}
