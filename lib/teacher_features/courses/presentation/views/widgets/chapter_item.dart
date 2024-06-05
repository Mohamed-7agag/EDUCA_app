import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/show_sub_classes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChapterItem extends StatelessWidget {
  final int index;
  final bool isExpanded;

  const ChapterItem({super.key, required this.index, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text("الفصل ${index + 1}"),
          trailing:
              isExpanded ? const Icon(Icons.remove) : const Icon(Icons.add),
          onTap: () {
            // navgaite
            context.read<ShowSubClassesCubit>().toggleExpansion(index);
          },
        ),
        // if (isExpanded)
        //   InkWell(
        //     onTap: () {
        //       Navigator.pushNamed(context, Routes.courseEditViewRoute);
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.only(
        //         left: 25,
        //       ),
        //       child: ListView.builder(
        //         physics: const NeverScrollableScrollPhysics(),
        //         shrinkWrap: true,
        //         itemCount: 4,
        //         itemBuilder: (context, subIndex) {
        //           return ListTile(title: Text("الدرس ${subIndex + 1}"));
        //         },
        //       ),
        //     ),
        //   )
      ],
    );
  }
}
