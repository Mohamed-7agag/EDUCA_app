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
        "Done",
        style: Styles.textStyle16,
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
        "Next",
        style: Styles.textStyle16,
      ),
      showSkipButton: true,
      skip: Text(
        "Skip",
        style: Styles.textStyle16.copyWith(color: kPrimaryColor),
      ),
      onSkip: () {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRouter.loginViewRoute, (route) => false);
      },
      pages: [
        PageViewModel(
          decoration: const PageDecoration(
              imageFlex: 2, imageAlignment: Alignment.topCenter),
          title: "Online Learning",
          body: "Instead of having to buy an entire share.",
          image: Image.asset(
            "assets/images/on1.png",
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        PageViewModel(
          decoration: const PageDecoration(
              imageFlex: 2, imageAlignment: Alignment.topCenter),
          title: "Learn From Anytime",
          body: "Instead of having to buy an entire share.",
          image: Image.asset(
            "assets/images/on2.png",
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        PageViewModel(
          decoration: const PageDecoration(
              imageFlex: 2, imageAlignment: Alignment.topCenter),
          title: "Learn From Anytime",
          body: "Instead of having to buy an entire share.",
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
