import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

import '../../../../Core/widgets/custom_cherry_toast.dart';

class VisaViewBody extends StatelessWidget {
  const VisaViewBody({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
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
              //! do something
              successCherryToast(
                  context, 'عملية دفع ناجحة', 'تمت عملية الدفع بنجاح');
              return NavigationDecision.navigate;
            } else if (request.url.contains("success=false")) {
              errorCherryToast(context, 'حدث خطا', 'فشلت عملية الدفع');
              return NavigationDecision.navigate;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    return WebViewWidget(
      controller: controller,
    );
  }
}
