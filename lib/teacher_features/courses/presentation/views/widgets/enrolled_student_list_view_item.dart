import 'package:field_training_app/Core/utils/constatnt.dart';

import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/enrolled_students_view_body.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EnrolledStudentListViewItem extends StatelessWidget {
  const EnrolledStudentListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TextButton(
        onPressed: () {},
        child: const Text('ازالة'),
      ),
      title: const Text(
        'محمد احمد محمد',
        textAlign: TextAlign.right,
      ),
      subtitle: Text(
        'تاريخ التسجيل ${DateFormat.yMd().format(DateTime.now())}',
        textAlign: TextAlign.right,
      ),
      trailing: const CircleAvatar(
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
