import 'package:bw_task_bloc/widgets/webview/loading_indicator.dart';
import 'package:bw_task_bloc/widgets/webview/webview_appbar.dart';
import 'package:bw_task_bloc/widgets/webview/webview_content.dart';
import 'package:bw_task_bloc/widgets/webview/webview_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bw_task_bloc/bloc/auth/auth_bloc.dart';
import 'package:bw_task_bloc/bloc/auth/auth_state.dart';
import 'package:bw_task_bloc/bloc/webview/webview_bloc.dart';
import 'package:bw_task_bloc/bloc/webview/webview_state.dart';
import 'package:bw_task_bloc/screens/phone_screen.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const PhoneScreen()),
          );
        }
      },

      //CONTROLLER
      child: WebViewControllerProvider(
        initialUrl: 'https://flutter.dev/showcase',
        child: Scaffold(

          //APPBAR
          appBar: const WebViewAppBar(title: 'WebView'),
          body: BlocBuilder<WebViewBloc, WebViewState>(
            builder: (context, state) {
              if (state is WebViewLoading) {

                //LOADING INDICATOR
                return const LoadingIndicator();
              }

              //WEBVIEW CONTENT
              return const WebViewContent();
            },
          ),
        ),
      ),
    );
  }
}