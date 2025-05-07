import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onCompleted;
  final void Function(String) onChanged;

  const OtpInputField({
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
      controller: controller,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Colors.grey,
        selectedColor: Theme.of(context).primaryColor,
      ),
      onCompleted: onCompleted,
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      animationDuration: const Duration(milliseconds: 300),
    );
  }
}