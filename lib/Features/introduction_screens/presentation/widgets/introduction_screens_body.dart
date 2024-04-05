import 'package:field_training_app/Core/utils/app_router.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreensBody extends StatelessWidget {
  const IntroScreensBody({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      animationDuration: 450,
      showDoneButton: true,
      done: Text(
        "لنبدا",
        style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
      ),
      doneStyle: const ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(Colors.white),
          backgroundColor: MaterialStatePropertyAll(kPrimaryColor)),
      onDone: () {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRouter.loginViewRoute, (route) => false);
      },
      showNextButton: true,
      nextStyle: const ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(Colors.white),
          backgroundColor: MaterialStatePropertyAll(kPrimaryColor)),
      next: Text(
        "التالي",
        style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
      ),
      showSkipButton: true,
      skip: Text(
        "تخطي",
        style: Styles.textStyle16
            .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
      ),
      onSkip: () {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRouter.loginViewRoute, (route) => false);
      },
      pages: [
        PageViewModel(
          decoration: const PageDecoration(
              imageFlex: 2, imageAlignment: Alignment.topCenter),
          title: "مرحبًا بك في تطبيق البحث عن معلمين!",
          body: "استكشاف خياراتنا المتنوعة للعثور على المعلم المناسب لك",
          image: Image.asset(
            "assets/images/on1.png",
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        PageViewModel(
          decoration: const PageDecoration(
              imageFlex: 2, imageAlignment: Alignment.topCenter),
          title: "خطوات بسيطة للبدء في البحث عن معلم",
          body: "اختيار المعلم المناسب وحجز الدروس بسهولة",
          image: Image.asset(
            "assets/images/on2.png",
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        PageViewModel(
          decoration: const PageDecoration(
              imageFlex: 2, imageAlignment: Alignment.topCenter),
          title: "استفد إلى أقصى حد ممكن من تجربة التعلم الخاصة بك",
          body: "تقييم المعلمين وتقديم ملاحظات لتحسين التجربة التعليمية",
          image: Image.asset(
            "assets/images/on33.png",
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
      ],
      dotsFlex: 2,
      dotsDecorator: DotsDecorator(
        size: const Size(7, 7),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: const Color.fromARGB(255, 218, 218, 218),
        activeColor: kPrimaryColor,
        activeSize: const Size(24, 7),
      ),
    );
  }
}
