import 'package:bw_task_bloc/constants/theme_constants.dart';
import 'package:bw_task_bloc/widgets/phone/custom_button.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final bool isLoading;
  final Function(String) onPhoneSubmit;
  final String phoneNumber;

  const SubmitButton({
    Key? key,
    required this.isLoading,
    required this.onPhoneSubmit,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Continue',
      isLoading: isLoading,
      onPressed: () {
        // Remove non-digits and the country code if present
        String digitsOnly = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
        
        // Handle different phone number formats
        if (digitsOnly.startsWith('91') && digitsOnly.length > 10) {
          digitsOnly = digitsOnly.substring(2); // Remove country code
        }
        
        bool isValid = digitsOnly.length == 10;

        if (isValid) {
          String formattedNumber = '+91$digitsOnly';
          onPhoneSubmit(formattedNumber);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please enter a valid 10-digit Indian mobile number'),
              backgroundColor: AppTheme.primaryColor,
            ),
          );
        }
      },
    );
  }
}