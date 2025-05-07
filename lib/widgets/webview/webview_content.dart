import 'package:bw_task_bloc/widgets/webview/webview_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContent extends StatelessWidget {
  const WebViewContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = WebViewControllerInherited.of(context);
    
    return WebViewWidget(
      controller: controller,
    );
  }
}