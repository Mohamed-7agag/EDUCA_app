import 'package:flutter/material.dart';
import '../widgets/visa_view_body.dart';

class VisaView extends StatelessWidget {
  const VisaView({super.key, required this.url, required this.subjectID});
  final String url;
  final int subjectID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: VisaViewBody(url: url,subjectID: subjectID,),
    );
  }
}
