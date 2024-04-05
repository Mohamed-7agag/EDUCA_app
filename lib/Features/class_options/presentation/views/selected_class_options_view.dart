import 'package:field_training_app/Features/class_options/presentation/widgets/selected_class_options_view_body.dart';
import 'package:flutter/material.dart';

class SelectedClassOptionsView extends StatelessWidget {
  const SelectedClassOptionsView({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SelectedClassOptionsViewBody(
        idx: index,
      )),
    );
  }
}
