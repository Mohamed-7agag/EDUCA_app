import 'package:field_training_app/Core/utils/styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class BuildFileItem extends StatelessWidget {
  BuildFileItem({super.key, required this.file});

  final PlatformFile file;

  @override
  Widget build(BuildContext context) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final fileSize = mb >= 1 ? mb.toStringAsFixed(2) : kb.toStringAsFixed(2);
    final extension = file.extension ?? "none";
    final color = getColor(extension);

    return InkWell(
        onTap: () {
          OpenFile.open(file.path!);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                ".$extension",
                style: Styles.textStyle18.copyWith(color: Colors.white),
              ),
            )),
          ]),
        ));
  }
  getColor(String extension) {
  return extension == "pdf" ? Colors.red : Colors.blue;
}
}