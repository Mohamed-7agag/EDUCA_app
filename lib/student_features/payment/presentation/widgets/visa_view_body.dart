// ignore_for_file: library_private_types_in_public_api

import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:field_training_app/student_features/enrollment/presentation/view_model/cubit/enrollment_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import '../../../../Core/widgets/custom_cherry_toast.dart';

class VisaViewBody extends StatefulWidget {
  const VisaViewBody({super.key, required this.url, required this.subjectID});
  final String url;
  final int subjectID;

  @override
  _VisaViewBodyState createState() => _VisaViewBodyState();
}

class _VisaViewBodyState extends State<VisaViewBody> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.google.com/')) {
              return NavigationDecision.prevent;
            }
            if (request.url.contains("success=true")) {
              context.read<EnrollmentCubit>().studentEnrollment(
                    CacheHelper.getData(key: ApiKey.id),
                    widget.subjectID,
                  );
              successCherryToast(
                  context, 'عملية دفع ناجحة', 'تمت عملية الدفع بنجاح');
              return NavigationDecision.navigate;
            } else if (request.url.contains("success=false")) {
              errorCherryToast(context, 'حدث خطأ', 'فشلت عملية الدفع');
              return NavigationDecision.navigate;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const CustomPopIconButton(backgroundColor: Colors.white70),
        actions: [
          Text("الدفع الألكتروني",
              style: Styles.textStyle18.copyWith(color: Colors.white)),
          SizedBox(width: 14.w),
        ],
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
