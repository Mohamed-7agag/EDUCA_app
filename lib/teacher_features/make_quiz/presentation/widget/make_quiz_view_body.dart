import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/question_model.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/quiz_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum MyOption { option1, option2, option3, option4 }

class MakeQuizViewBody extends StatefulWidget {
  const MakeQuizViewBody({super.key, required this.titleQuiz});

  @override
  State<MakeQuizViewBody> createState() => _MakeQuizViewBodyState();
  final String titleQuiz;
}

class _MakeQuizViewBodyState extends State<MakeQuizViewBody> {
  TextEditingController questionController = TextEditingController();
  TextEditingController answer1Controller = TextEditingController();
  TextEditingController answer2Controller = TextEditingController();
  TextEditingController answer3Controller = TextEditingController();
  TextEditingController answer4Controller = TextEditingController();

  MyOption myOption = MyOption.option1;
  String answer = '';

  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.showQuizViewRoute);
                  },
                  child: const Text(
                    " عرض الاختبار",
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  ),
                ),
                const Text(
                  'السؤال :  1',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: questionController,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                  hintText: 'ادخل السؤال',
                  hintTextDirection: TextDirection.rtl,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: kPrimaryColor),
                  )),
            ),
            const SizedBox(height: 20),
            Text(
              ' الاختيارات ',
              textAlign: TextAlign.end,
              style: Styles.textStyle20,
            ),
            RadioListTile(
              activeColor: kPrimaryColor,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: const EdgeInsets.all(0),
              value: MyOption.option1,
              title: TextField(
                controller: answer1Controller,
                textAlign: TextAlign.end,
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor, width: 1.3),
                  ),
                ),
              ),
              groupValue: myOption,
              onChanged: (val) {
                setState(() {
                  myOption = val!;
                  answer = answer1Controller.text;
                });
              },
            ),
            RadioListTile(
              activeColor: kPrimaryColor,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: const EdgeInsets.all(0),
              value: MyOption.option2,
              title: TextField(
                controller: answer2Controller,
                textAlign: TextAlign.end,
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor, width: 1.3),
                  ),
                ),
              ),
              groupValue: myOption,
              onChanged: (val) {
                setState(() {
                  myOption = val!;
                  answer = answer2Controller.text;
                });
              },
            ),
            RadioListTile(
              activeColor: kPrimaryColor,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: const EdgeInsets.all(0),
              value: MyOption.option3,
              title: TextField(
                controller: answer3Controller,
                textAlign: TextAlign.end,
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor, width: 1.3),
                  ),
                ),
              ),
              groupValue: myOption,
              onChanged: (val) {
                setState(() {
                  myOption = val!;
                  answer = answer3Controller.text;
                });
              },
            ),
            RadioListTile(
              activeColor: kPrimaryColor,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: const EdgeInsets.all(0),
              value: MyOption.option4,
              title: TextField(
                controller: answer4Controller,
                textAlign: TextAlign.end,
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor, width: 1.3),
                  ),
                ),
              ),
              groupValue: myOption,
              onChanged: (val) {
                setState(() {
                  myOption = val!;
                  answer = answer4Controller.text;
                });
              },
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: CustomButton(
                text: 'اضافة السؤال',
                onpressed: () {
                  if (myOption == MyOption.option1) {
                    answer = answer1Controller.text;
                  }
                  setState(() {});
                  if (questionController.text == '') {
                    errorCherryToast(context, "حدث خطاء", "ادخل السؤال");
                  } else if (answer1Controller.text == '' ||
                      answer2Controller.text == '' ||
                      answer3Controller.text == '' ||
                      answer4Controller.text == '') {
                    errorCherryToast(
                        context, "حدث خطاء", "ادخل جميع الاختيارات");
                  } else {
                    successCherryToast(
                      context,
                      "تم اضافة السؤال",
                      "اضف سؤال اخر",
                    );
                    questionList.add(QuestionModel(
                        question: questionController.text,
                        answers: [
                          answer1Controller.text,
                          answer2Controller.text,
                          answer3Controller.text,
                          answer4Controller.text
                        ],
                        correctAnswer: answer));
                  }
                },
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
                text: "انهاء الاختبار",
                onpressed: () {
                  quizList.add(QuizModel(
                    questions: questionList,
                    title: widget.titleQuiz,
                    date: "2022-11-11",
                  ));
                }),
          ],
        ),
      ),
    );
  }
}
