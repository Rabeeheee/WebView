import 'package:bw_task_bloc/bloc/otp/otp_bloc.dart';
import 'package:bw_task_bloc/bloc/otp/otp_event.dart';
import 'package:bw_task_bloc/constants/theme_constants.dart';
import 'package:bw_task_bloc/widgets/otp/header_widget.dart';
import 'package:bw_task_bloc/widgets/otp/otp_input_widget.dart';
import 'package:bw_task_bloc/widgets/otp/verification_button.dart';
import 'package:bw_task_bloc/widgets/otp/support_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpBody extends StatefulWidget {
  final String phoneNumber;
  final bool isLoading;

  const OtpBody({
    Key? key,
    required this.phoneNumber,
    required this.isLoading,
  }) : super(key: key);

  @override
  _OtpBodyState createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _currentOtp = '';

  void _verifyOtp() {
    if (_formKey.currentState!.validate() && _currentOtp.length == 6) {
      context.read<OtpBloc>().add(OtpSubmitted(_currentOtp));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                OtpHeaderWidget(phoneNumber: widget.phoneNumber),
                OtpInputWidget(
                  controller: _otpController,
                  onCompleted: (value) {
                    _currentOtp = value;
                    if (value.length == 6) {
                      _verifyOtp();
                    }
                  },
                  onChanged: (value) {
                    _currentOtp = value;
                  },
                ),
                const SizedBox(height: 30),
                VerificationButton(
                  isLoading: widget.isLoading,
                  onPressed: widget.isLoading ? null : _verifyOtp,
                ),
                const SizedBox(height: 24),
                const SupportTextWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}