import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/student_features/search/data/models/teacher_searched_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherSearchItem extends StatelessWidget {
  const TeacherSearchItem({super.key, required this.teacherSearchedModel});

  final TeacherSearchedModel teacherSearchedModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 70.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
                "${teacherSearchedModel.firstName} ${teacherSearchedModel.lastName}"),
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
                child: teacherSearchedModel.profileImageUrl != null
                    ? Image.network(
                        teacherSearchedModel.profileImageUrl!,
                        fit: BoxFit.fill,
                      )
                    : const Icon(Icons.person, color: kPrimaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
