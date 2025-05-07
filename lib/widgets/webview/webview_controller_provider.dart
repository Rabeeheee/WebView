import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:bw_task_bloc/bloc/webview/webview_bloc.dart';
import 'package:bw_task_bloc/bloc/webview/webview_event.dart';

class WebViewControllerProvider extends StatefulWidget {
  final String initialUrl;
  final Widget child;

  const WebViewControllerProvider({
    Key? key,
    required this.initialUrl,
    required this.child,
  }) : super(key: key);

  @override
  State<WebViewControllerProvider> createState() => _WebViewControllerProviderState();
}

class _WebViewControllerProviderState extends State<WebViewControllerProvider> with WidgetsBindingObserver {
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.initialUrl))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            context.read<WebViewBloc>().add(WebViewPageLoaded());
          },
        ),
      );

    context.read<WebViewBloc>().add(WebViewStarted());
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    if (keyboardHeight > 0) {
      context.read<WebViewBloc>().add(WebViewKeyboardShown(keyboardHeight));
      _adjustWebViewForKeyboard(keyboardHeight);
    } else {
      context.read<WebViewBloc>().add(WebViewKeyboardHide());
      _resetWebViewLayout();
    }
  }

  void _adjustWebViewForKeyboard(double keyboardHeight) {
    _webViewController.runJavaScript('''
      var viewport = document.querySelector('meta[name="viewport"]');
      if (viewport) {
        viewport.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, height=${MediaQuery.of(context).size.height - keyboardHeight}px');
      }
      document.body.style.height = '${MediaQuery.of(context).size.height - keyboardHeight}px';
      document.body.style.overflow = 'auto';
    ''');
  }

  void _resetWebViewLayout() {
    _webViewController.runJavaScript('''
      var viewport = document.querySelector('meta[name="viewport"]');
      if (viewport) {
        viewport.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no');
      }
      document.body.style.height = '100%';
    ''');
  }

  @override
  Widget build(BuildContext context) {
    return WebViewControllerInherited(
      controller: _webViewController,
      child: widget.child,
    );
  }
}

class WebViewControllerInherited extends InheritedWidget {
  final WebViewController controller;

  const WebViewControllerInherited({
    Key? key,
    required this.controller,
    required Widget child,
  }) : super(key: key, child: child);

  static WebViewController of(BuildContext context) {
    final WebViewControllerInherited? result = 
        context.dependOnInheritedWidgetOfExactType<WebViewControllerInherited>();
    assert(result != null, 'No WebViewControllerInherited found in context');
    return result!.controller;
  }

  @override
  bool updateShouldNotify(WebViewControllerInherited oldWidget) {
    return controller != oldWidget.controller;
  }
}