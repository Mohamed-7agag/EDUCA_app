import 'package:flutter/material.dart';
import '../widgets/class_options_view_body.dart';

class ClassOptionsView extends StatelessWidget {
  const ClassOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ClassOptionsViewBody()),
    );
  }
}
