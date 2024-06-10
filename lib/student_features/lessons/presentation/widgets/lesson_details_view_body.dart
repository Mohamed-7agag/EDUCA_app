import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_failure_widget.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/student_features/lessons/presentation/view_model/cubit/lessons_cubit.dart';
import 'package:field_training_app/student_features/lessons/presentation/widgets/convert_to_pdf_function.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonDetailsViewBody extends StatelessWidget {
  const LessonDetailsViewBody({super.key});

  Future<bool> requestPermissions() async {
    final statuses = await [
      Permission.storage,
      Permission.manageExternalStorage,
    ].request();

    return statuses[Permission.storage]!.isGranted &&
        statuses[Permission.manageExternalStorage]!.isGranted;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<LessonsCubit, LessonsState>(
        builder: (context, state) {
          if (state is LessonItemsSuccess) {
            return Column(
              children: [
                Text(state.lessonItems[3].contentType!),
                CustomButton(
                    text: 'تحميل',
                    onpressed: () async {
                      if (!await requestPermissions()) {
                        try {
                          await convertToPDF(
                              base64Content: state.lessonItems[3].fileContent!,
                              fileName: state.lessonItems[3].fileName!);
                        } catch (e) {
                          print('Error: $e');
                        }
                      } else {
                        print('Permission denied');
                      }
                    }),
              ],
            );
          } else if (state is LessonItemsFailure) {
            return CustomFailureWidget(errMessage: state.errMessage);
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }
}
