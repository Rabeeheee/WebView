import 'package:bw_task_bloc/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class SupportTextWidget extends StatelessWidget {
  const SupportTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Didn\'t receive code?',
          style: TextStyle(
            fontSize: 14,
            color: AppTheme.textGrey,
          ),
        ),
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Please try again later'),
                backgroundColor: AppTheme.primaryColor,
              ),
            );
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(50, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            foregroundColor: AppTheme.primaryColor,
          ),
          child: Text(
            'Contact Support',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}