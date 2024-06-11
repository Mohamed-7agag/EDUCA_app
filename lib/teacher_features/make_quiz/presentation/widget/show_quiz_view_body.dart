import 'package:field_training_app/Core/models/question_model.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/show_quiz_listview_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowQuizViewBody extends StatelessWidget {
  const ShowQuizViewBody(
      {super.key,
      required this.allquestionList,
      required this.quizId,
      required this.subjectId,
      required this.titleQuiz});
  final List<QuestionModel> allquestionList;
  final int quizId;
  final int subjectId;
  final String titleQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(left: 35),
        //   child: Container(
        //     padding: EdgeInsets.only(right: 20.w, left: 5.w),
        //     width: double.infinity,
        //     height: 73,
        //     decoration: BoxDecoration(
        //       color: kPrimaryColor,
        //       borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.circular(100.r),
        //         topLeft: Radius.circular(100.r),
        //       ),
        //     ),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         IconButton(
        //           style: IconButton.styleFrom(
        //               backgroundColor: Colors.white,
        //               foregroundColor: kPrimaryColor,
        //               padding: const EdgeInsets.all(13)),
        //           onPressed: () {},
        //           icon: const Icon(
        //             Icons.list_alt_outlined,
        //             size: 38,
        //           ),
        //         ),
        //         Text(
        //           "$titleQuiz \n ${allquestionList.length} سؤال",
        //           textDirection: TextDirection.rtl,
        //           style: Styles.textStyle18.copyWith(color: Colors.white),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        SizedBox(height: 10.h),
        Expanded(
          child: ShowQuizListViewBuider(allquestionList: allquestionList),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              onpressed: () {
                Navigator.pushNamed(context, Routes.createQuizViewRoute,
                    arguments: {
                      'quizId': quizId,
                      'subjectId': subjectId,
                      'titleQuiz': titleQuiz,
                    });
              },
              text: "اضافة سؤال",
            )),
      ],
    );
  }
}
