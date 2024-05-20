import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_failure_widget.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:field_training_app/student_features/quiz/presentation/view_model/quiz_cubit/quiz_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizzesListView extends StatelessWidget {
  const QuizzesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const CustomPopIconButton(backgroundColor: Colors.white70),
        actions: [
          Text("الأختبارات",
              style: Styles.textStyle18.copyWith(color: Colors.white)),
          SizedBox(width: 14.w),
        ],
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
      ),
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state is QuizSuccess) {
            return ListView.builder(
              itemCount: state.quizzes.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(state.quizzes[index].subjectId!.toString());
              },
            );
          } else if (state is QuizFaliure) {
            return const CustomFailureWidget(
                errMessage: 'حدث خطأ أثناء الحصول على الأختبارات');
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }
}
