import 'package:bw_task_bloc/constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onCompleted;
  final Function(String) onChanged;

  const OtpInputWidget({
    Key? key,
    required this.controller,
    required this.onCompleted,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(AppTheme.cardRadius / 2),
        fieldHeight: 50,
        fieldWidth: 45,
        activeFillColor: AppTheme.inputBackground,
        inactiveFillColor: AppTheme.inputBackground,
        selectedFillColor: AppTheme.inputBackground,
        activeColor: AppTheme.primaryColor,
        inactiveColor: AppTheme.borderColor,
        selectedColor: AppTheme.primaryColor,
      ),
      cursorColor: AppTheme.primaryColor,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onCompleted: onCompleted,
      onChanged: onChanged,
      beforeTextPaste: (text) {
        // Allow only digits
        if (text == null) return false;
        return text.contains(RegExp(r'^[0-9]+$'));
      },
    );
  }
}