import 'package:bw_task_bloc/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class OtpHeaderWidget extends StatelessWidget {
  final String phoneNumber;

  const OtpHeaderWidget({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Verification Code',
          style: AppTheme.headingStyle,
        ),
        const SizedBox(height: AppTheme.smallSpacing),
        Text(
          'We have sent a verification code to',
          style: AppTheme.subheadingStyle,
        ),
        const SizedBox(height: 4),
        Text(
          phoneNumber,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppTheme.textDark,
          ),
        ),
        const SizedBox(height: AppTheme.formSpacing),
      ],
    );
  }
}