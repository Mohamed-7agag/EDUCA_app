import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/views_model/cubit/get_all_question_cubit.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/show_quiz_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowQuizView extends StatelessWidget {
  const ShowQuizView(
      {super.key,
      required this.quizId,
      required this.subjectId,
      required this.titleQuiz});
  final int quizId;
  final int subjectId;
  final String titleQuiz;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllQuestionCubit, GetAllQuestionState>(
      builder: (context, state) {
        if (state is GetAllQuestionFailure) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(
                  //   '${questionList.length} سؤال',
                  //   style: Styles.textStyle18.copyWith(color: kPrimaryColor),
                  //   textDirection: TextDirection.rtl,
                  // )
                ],
              ),
            ),
            body: Center(
              child: Text(state.errMessage),
            ),
          );
        } else if (state is GetAllQuestionSuccess) {
          return Scaffold(
            // appBar: AppBar(
            //   automaticallyImplyLeading: false,
            //   title: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         '${state.questionModelList.length} سؤال',
            //         style: Styles.textStyle18.copyWith(color: kPrimaryColor),
            //         textDirection: TextDirection.rtl,
            //       ),
            //       Text(
            //         titleQuiz,
            //         style: const TextStyle(
            //             fontSize: 25, fontWeight: FontWeight.bold),
            //       ),
            //     ],
            //   ),
            // ),
            body: SafeArea(
              child: ShowQuizViewBody(
                allquestionList: state.questionModelList,
                quizId: quizId,
                subjectId: subjectId,
                titleQuiz: titleQuiz,
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: CustomLoadingWidget(),
          );
        }
      },
    );
  }
}
