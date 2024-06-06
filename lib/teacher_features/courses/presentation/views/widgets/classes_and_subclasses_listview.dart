import 'package:field_training_app/teacher_features/courses/data/models/chapter_model.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/chapter_item.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/show_sub_classes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesAndSubClassesListViews extends StatelessWidget {
  const ClassesAndSubClassesListViews({
    super.key,
    required this.chaptersList,
  });

  final List<ChapterModel> chaptersList;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowSubClassesCubit(),
      child: SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: chaptersList.length,
          (context, index) {
            return BlocBuilder<ShowSubClassesCubit, Map<int, bool>>(
              builder: (context, statee) {
                return ChapterItem(
                  index: index,
                  chapterModel: chaptersList[index],
                  isExpanded: statee[index] ?? false,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
