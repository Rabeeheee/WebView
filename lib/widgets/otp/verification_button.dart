import 'package:bw_task_bloc/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class VerificationButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;

  const VerificationButton({
    Key? key,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppTheme.buttonHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          foregroundColor: AppTheme.textLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.cardRadius),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppTheme.textLight),
                ),
              )
            : Text(
                'Verify & Proceed',
                style: AppTheme.buttonTextStyle,
              ),
      ),
    );
  }
}