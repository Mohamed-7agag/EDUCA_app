import 'package:field_training_app/Core/utils/app_router.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1600), () {
      Navigator.pushReplacementNamed(context, AppRouter.introScreensViewRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Image.asset(
          "assets/images/logo.png",
          width: 100,
        ),
      )),
    );
  }
}
