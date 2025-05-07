import 'package:bw_task_bloc/bloc/otp/otp_bloc.dart';
import 'package:bw_task_bloc/bloc/otp/otp_state.dart';
import 'package:bw_task_bloc/widgets/otp/otp_body.dart';
import 'package:bw_task_bloc/constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'webview_screen.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  
  const OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,

      //APPBAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.backgroundLight,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppTheme.textDark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<OtpBloc, OtpState>(
        listener: (context, state) {
          if (state is OtpVerified) {
            Future.microtask(() {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const WebViewScreen(),
                ),
              );
            });
          }
          if (state is OtpError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red[700],
              ),
            );
          }
        },
        builder: (context, state) {

          //FORM AND OTP VERIFICATIONS
          return OtpBody(
            phoneNumber: phoneNumber,
            isLoading: state is OtpLoading,
          );
        },
      ),
    );
  }
}