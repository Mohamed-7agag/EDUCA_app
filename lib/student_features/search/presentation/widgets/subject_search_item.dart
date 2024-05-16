import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/student_features/search/data/models/subject_searched_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectSearchItem extends StatelessWidget {
  const SubjectSearchItem({super.key, required this.subjectSearchedModel});
  final SubjectSearchedModel subjectSearchedModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("${subjectSearchedModel.teacherName}"),
            SizedBox(width: 10.w),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: kSplashColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: subjectSearchedModel.profileImageUrl != null
                    ? Image.network(
                        subjectSearchedModel.profileImageUrl!,
                        fit: BoxFit.fill,
                      )
                    : const Icon(Icons.person, color: kPrimaryColor),
              ),
            )
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("${subjectSearchedModel.level}", style: Styles.textStyle12),
            SizedBox(width: 14.w),
            Text("${subjectSearchedModel.subjName}"),
          ],
        ),
        const Divider(color: Colors.grey, thickness: 0.4),
      ],
    );
  }
}
