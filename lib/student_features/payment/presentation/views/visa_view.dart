import 'package:flutter/material.dart';
import '../widgets/visa_view_body.dart';

class VisaView extends StatelessWidget {
  const VisaView({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: VisaViewBody(url: url)),
    );
  }
}
