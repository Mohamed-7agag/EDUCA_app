import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/course_edit_view_body.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/drop_down_list_chapter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseEditView extends StatelessWidget {
  const CourseEditView(
      {super.key,
      required this.subjectId,
      required this.chaptersN,
      required this.chapterIndx,
      required this.chapterId,
      required this.namech});
  final int subjectId;
  final List<String> chaptersN;
  final Map<String, int> chapterIndx;
  final int chapterId;
  final String namech;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'تعديل المادة',
          style: Styles.textStyle20
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
          child: BlocProvider(
        create: (context) => DropDownListChapterCubit(),
        child: CourseEditViewBody(
          namech: namech,
          chapterId: chapterId,
          chapterIndex: chapterIndx,
          chaptersN: chaptersN,
          subjectId: subjectId,
        ),
      )),
    );
  }
}
