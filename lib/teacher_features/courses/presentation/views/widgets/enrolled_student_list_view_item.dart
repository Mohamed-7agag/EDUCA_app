import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EnrolledStudentListViewItem extends StatelessWidget {
  const EnrolledStudentListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(foregroundColor: kPrimaryColor),
        child: const Text('ازالة'),
      ),
      title: const Text(
        'محمد احمد محمد',
        textAlign: TextAlign.right,
      ),
      subtitle: Text(
        'تاريخ التسجيل ${DateFormat.yMd().format(DateTime.now())}',
        textAlign: TextAlign.right,
        style: Styles.textStyle12,
      ),
      trailing: const CircleAvatar(backgroundColor: kPrimaryColor),
    );
  }
}
