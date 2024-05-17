
import 'package:flutter/material.dart';

class ShowAllQuizzesListViewItem extends StatelessWidget {
  const ShowAllQuizzesListViewItem({
    super.key,
    required this.quizName,
    required this.quizDate,
    required this.questionNumbers,
    required this.onDelete,
    required this.onEdit,
  });

  final String quizName;
  final String quizDate;
  final String questionNumbers;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.description_outlined),
      title: Text(quizName),
      subtitle: Row(
        children: [
          Text(quizDate),
          const Spacer(),
          Text('$questionNumbers اسئلة'),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton.icon(
            onPressed: onEdit,
            icon: const Icon(Icons.edit_outlined),
            label: const Text('تعديل'),
          ),
          TextButton.icon(
            onPressed: onDelete,
            icon: const Icon(Icons.delete_outlined),
            label: const Text('حذف'),
          ),
        ],
      ),
    );
  }
}
