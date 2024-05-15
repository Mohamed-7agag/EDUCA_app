import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/question_model.dart';

import 'package:flutter/material.dart';

enum MyOption { option1, option2, option3, option4 }

class MakeQuizViewBody extends StatefulWidget {
  const MakeQuizViewBody({super.key});

  @override
  State<MakeQuizViewBody> createState() => _MakeQuizViewBodyState();
}

class _MakeQuizViewBodyState extends State<MakeQuizViewBody> {
  TextEditingController questionController = TextEditingController();
  TextEditingController answer1Controller = TextEditingController();
  TextEditingController answer2Controller = TextEditingController();
  TextEditingController answer3Controller = TextEditingController();
  TextEditingController answer4Controller = TextEditingController();

  MyOption myOption = MyOption.option1;
  String Answer = '';

  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.showQuizViewRoute);
                    },
                    child: const Text(
                      " عرض الاختبار",
                      style: TextStyle(color: kPrimaryColor, fontSize: 23),
                    )),
                const Text(
                  'السؤال :  1',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: questionController,
              decoration: InputDecoration(
                hintText: 'ادخل السؤال',
                hintTextDirection: TextDirection.rtl,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              ' الاختيارات ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 19),
            ),
            RadioListTile(
              activeColor: kPrimaryColor,
              value: MyOption.option1,
              title: TextField(
                controller: answer1Controller,
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                ),
              ),
              groupValue: myOption,
              onChanged: (val) {
                setState(() {
                  myOption = val!;
                  Answer = answer1Controller.text;
                });
              },
            ),
            RadioListTile(
              activeColor: kPrimaryColor,
              value: MyOption.option2,
              title: TextField(
                controller: answer2Controller,
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                ),
              ),
              groupValue: myOption,
              onChanged: (val) {
                setState(() {
                  myOption = val!;
                  Answer = answer2Controller.text;
                });
              },
            ),
            RadioListTile(
              activeColor: kPrimaryColor,
              value: MyOption.option3,
              title: TextField(
                controller: answer3Controller,
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                ),
              ),
              groupValue: myOption,
              onChanged: (val) {
                setState(() {
                  myOption = val!;
                  Answer = answer3Controller.text;
                });
              },
            ),
            RadioListTile(
              activeColor: kPrimaryColor,
              value: MyOption.option4,
              title: TextField(
                controller: answer4Controller,
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                ),
              ),
              groupValue: myOption,
              onChanged: (val) {
                setState(() {
                  myOption = val!;
                  Answer = answer4Controller.text;
                });
              },
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: CustomButton(
                text: 'اضافة السؤال',
                onpressed: () {
                  if (myOption == MyOption.option1) {
                    Answer = answer1Controller.text;
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
                        correctAnswer: Answer));
                  }
                },
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(text: "انهاء الاختبار", onpressed: () {})
          ],
        ),
      ),
    );
  }
}
