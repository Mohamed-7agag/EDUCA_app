import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class CourseEditViewBody extends StatefulWidget {
  const CourseEditViewBody({super.key});

  @override
  State<CourseEditViewBody> createState() => _CourseEditViewBodyState();
}

class _CourseEditViewBodyState extends State<CourseEditViewBody> {
  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:const BoxConstraints(maxHeight: 500),
    
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: ElevatedButton(
          child: const Text('upload file'),
          onPressed: () async {
            final result = await FilePicker.platform.pickFiles();
            if (result == null) return;

            final file = result.files.first;

            openFile(file);
          },
        ),
      ),
    );
  }
}
