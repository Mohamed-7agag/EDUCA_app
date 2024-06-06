import 'package:field_training_app/Core/utils/app_services.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/chapter_files_repo/chaoter_files_repo.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/chapter_files_repo/chapter_files_repo_implement.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/build_file_item.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/get_file_cubit/get_files_cubit.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MediaListView extends StatelessWidget {
  const MediaListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetFilesCubit(getIt<ChapterFilesRepoImplement>())
        ..getFiles(chapterId: 1),
      child: BlocBuilder<GetFilesCubit, GetFilesState>(
        builder: (context, state) {
          if (state is GetFilesFailure) {
            return SliverToBoxAdapter(child: Text(state.message));
          } else if (state is GetFilesSuccess) {
            // return SliverList(
            //     delegate: SliverChildBuilderDelegate(
            //   childCount: state.files.length,
            //   (context, index) {
            //     return BuildFileItem(file: state.files[index]);
            //   },
            // ));

            return SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.files.length,
                  (context, index) {
                    return BuildFileItem(file: state.files[index]);
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2));
          } else {
            return SliverToBoxAdapter(child: const CustomLoadingWidget());
          }
        },
      ),
    );
  }
}
