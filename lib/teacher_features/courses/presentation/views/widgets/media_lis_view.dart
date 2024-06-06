import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/build_file_item.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class MediaListView extends StatelessWidget {
  const MediaListView({super.key, required this.files});

  final List<PlatformFile> files;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: files.length,
      (context, index) {
        return BuildFileItem(file: files[index]);
      },
    ));
  }
}
