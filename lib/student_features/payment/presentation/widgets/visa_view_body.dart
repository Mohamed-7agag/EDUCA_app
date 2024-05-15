// ignore_for_file: must_be_immutable

import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class VisaViewBody extends StatelessWidget {
  VisaViewBody({super.key});

  PlatformWebViewControllerCreationParams params =
      const PlatformWebViewControllerCreationParams();

  WebViewController controller = WebViewController()
    ..platform
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
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(PaymentConstants.visaUrl));

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: controller,
    );
  }
}
