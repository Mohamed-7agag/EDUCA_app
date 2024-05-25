import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/views_model/add_quiz_cubit/add_quiz_cubit.dart';

import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/show_all_quizzes_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowAllQuizzesListViewBuilder extends StatelessWidget {
  ShowAllQuizzesListViewBuilder({super.key, required this.subjectId});

  final TextEditingController controller = TextEditingController();
  final int subjectId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Container(
            padding: EdgeInsets.only(right: 20.w, left: 5.w),
            width: double.infinity,
            height: 73,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100.r),
                topLeft: Radius.circular(100.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: kPrimaryColor,
                      padding: const EdgeInsets.all(13)),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.list_alt_outlined,
                    size: 38,
                  ),
                ),
                Text(
                  "اختبارات المادة",
                  textDirection: TextDirection.rtl,
                  style: Styles.textStyle18.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
        BlocBuilder<AddQuizCubit, AddQuizState>(
          builder: (context, state) {
            if (state is GetAllQuizSuccess) {
              return state.quizModelList.isEmpty
                  ? const Expanded(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.question_answer_outlined,
                          size: 50,
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            ' لهذه المادة لا يوجد اختبارات  \nاضف اختبار ',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ],
                    ))
                  : Expanded(
                      child: ListView.builder(
                          itemCount: state.quizModelList.length,
                          itemBuilder: (context, index) {
                            return ShowAllQuizzesListViewItem(
                              quizModel: state.quizModelList[index],
                            );
                          }),
                    );
            } else if (state is GetAllQuizFailure) {
              {
                return Text(state.errMessage);
              }
            } else {
              return const CustomLoadingWidget();
            }
          },
        ),
        BlocConsumer<AddQuizCubit, AddQuizState>(
          listener: (context, state) {
            if (state is AddQuizSuccess) {
              successCherryToast(
                  context, 'تمت العملية بنجاح', 'تم اضافة الاختبار بنجاح');
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(
                Routes.createQuizViewRoute,
                arguments: {
                  "quizId": state.quizModel.id,
                  "titleQuiz": controller.text,
                  "subjectId": subjectId
                },
              );
            } else if (state is AddQuizFailure) {
              errorCherryToast(context, 'خطأ', 'خطأ في عملية الاضافة');
            }
          },
          builder: (context, state) {
            return state is AddQuizLoading
                ? const CustomLoadingWidget()
                : Padding(
                    padding:
                        const EdgeInsets.only(bottom: 24, right: 20, left: 20),
                    child: CustomButton(
                      onpressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("اضافة اختبار جديد"),
                            content: TextField(
                              decoration: const InputDecoration(
                                labelText: "اسم الاختبار",
                              ),
                              controller: controller,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  if (controller.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("يجب عليك ادخال اسم الاختبار"),
                                      ),
                                    );
                                  } else {
                                    context.read<AddQuizCubit>().addQuiz(
                                        title: controller.text,
                                        subjectId: subjectId);
                                  }
                                },
                                child: const Text("اضافة"),
                              ),
                            ],
                          ),
                        );
                      },
                      text: 'اضافة اختبار',
                    ),
                  );
          },
        ),
      ],
    );
  }
}
